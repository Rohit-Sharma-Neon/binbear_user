import 'package:binbear/ui/base_components/animated_column.dart';
import 'package:binbear/ui/base_components/base_app_bar.dart';
import 'package:binbear/ui/base_components/base_button.dart';
import 'package:binbear/ui/base_components/base_container.dart';
import 'package:binbear/ui/base_components/base_outlined_button.dart';
import 'package:binbear/ui/base_components/base_text.dart';
import 'package:binbear/ui/dashboard_module/dashboard_screen/dashboard_screen.dart';
import 'package:binbear/ui/manual_address/components/address_search_field.dart';
import 'package:binbear/ui/map_view/controller/map_view_controller.dart';
import 'package:binbear/utils/base_assets.dart';
import 'package:binbear/utils/base_colors.dart';
import 'package:binbear/utils/base_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:scaled_app/scaled_app.dart';

class MapViewScreen extends StatefulWidget {
  final double? lat, long;
  const MapViewScreen({super.key, this.lat, this.long});

  @override
  State<MapViewScreen> createState() => _MapViewScreenState();
}

class _MapViewScreenState extends State<MapViewScreen> {

  final MapViewController controller = Get.find<MapViewController>();
  @override
  void initState() {
    super.initState();
    controller.addMarker(latitude: widget.lat??0, longitude: widget.long??0);
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).scale(),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        extendBody: true,
        appBar: const BaseAppBar(
          title: "Select Delivery Location",
          contentColor: Colors.black,
          titleSize: 19,
          fontWeight: FontWeight.w600,
        ),
        body: Stack(
          children: [
            GetBuilder<MapViewController>(
              builder: (MapViewController controller) {
                print("Widget Rebuild");
                return GoogleMap(
                  mapType: MapType.normal,
                  myLocationEnabled: true,
                  initialCameraPosition: controller.getInitialCameraPosition(lat: widget.lat??0, long: widget.long??0),
                  onMapCreated: (GoogleMapController googleMapController) {
                    controller.mapController.complete(googleMapController);
                  },
                  markers: Set<Marker>.of(controller.markers),
                );
              },
            ),
            Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                gradient: LinearGradient(
                  colors: [
                    Colors.white.withOpacity(0.9),
                    Colors.white.withOpacity(0.6),
                    Colors.white.withOpacity(0.4),
                    Colors.white.withOpacity(0.1),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: const [0.2, 0.4, 0.6, 1],
                ),
              ),
            ),
            Positioned(
              child: AddressSearchField(topMargin: 85,
              ),
            ),
          ],
        ),
        bottomNavigationBar: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            BaseOutlinedButton(
              borderRadius: 90,
              btnTopPadding: 6,
              btnBottomPadding: 6,
              btnRightPadding: 12,
              btnLeftPadding: 12,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(BaseAssets.icLocate, width: 22, height: 22),
                  const BaseText(
                    value: "LOCATE ME",
                    leftMargin: 6,
                    fontSize: 13,
                    color: BaseColors.primaryColor,
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),
              onPressed: (){
                controller.locateToCurrentLocation();
              },
            ),
            BaseContainer(
              color: const Color(0xff330601),
              borderRadius: 15,
              topPadding: 6,
              bottomPadding: 6,
              rightPadding: 4,
              leftPadding: 4,
              topMargin: 16,
              bottomMargin: 20,
              rightMargin: horizontalScreenPadding,
              leftMargin: horizontalScreenPadding,
              child: AnimatedColumn(
                children: [
                  Row(
                    children: [
                      const Expanded(
                        child: BaseText(
                          value: "207 A",
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      BaseButton(
                        title: "Change",
                        btnWidth: 0,
                        btnHeight: 0,
                        borderRadius: 7,
                        fontSize: 13,
                        btnColor: const Color(0xffDE875A),
                        padding: const EdgeInsets.only(top: 4, bottom: 4, right: 16, left: 16),
                        onPressed: (){},
                      ),
                    ],
                  ),
                  const BaseText(
                    value: "Mile Post, 96 NY State, Thruway, Ruby, NY 12475, United States",
                    fontSize: 11.5,
                    color: Color(0xffFBE6D3),
                    fontWeight: FontWeight.w400,
                  ),
                  BaseButton(
                    title: "Confirm Location",
                    topMargin: 20,
                    bottomMargin: 12,
                    onPressed: (){
                      Get.to(()=> const DashBoardScreen());
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
