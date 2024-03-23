import 'package:animate_do/animate_do.dart';
import 'package:binbear/ui/base_components/base_map_header_shadow.dart';
import 'package:binbear/ui/manage_address/manage_address_screen.dart';
import 'package:binbear/utils/base_functions.dart';
import 'package:binbear/utils/base_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:scaled_app/scaled_app.dart';
import '../../utils/base_assets.dart';
import '../../utils/base_colors.dart';
import '../base_components/animated_column.dart';
import '../base_components/base_app_bar.dart';
import '../base_components/base_button.dart';
import '../base_components/base_container.dart';
import '../base_components/base_outlined_button.dart';
import '../base_components/base_text.dart';
import '../manual_address/components/address_search_field.dart';
import 'controller/map_view_controller.dart';

class MapViewScreen extends StatefulWidget {
  final double? lat, long;
  final String? mainAddress;
  final String? subAddress;
  final String? fullAddress;
  const MapViewScreen({super.key, this.lat, this.long, this.mainAddress, this.subAddress, this.fullAddress});

  @override
  State<MapViewScreen> createState() => _MapViewScreenState();
}

class _MapViewScreenState extends State<MapViewScreen> {

  final MapViewController controller = Get.find<MapViewController>();

  @override
  void initState() {
    super.initState();
    controller.addMarker(latitude: widget.lat??0, longitude: widget.long??0);
    controller.searchController.clear();
  }

@override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).scale(),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        extendBody: true,
        appBar: BaseAppBar(
          title: "Select Delivery Location",
          contentColor: Colors.black,
          titleSize: 19,
          fontWeight: FontWeight.w500,
          bottomWidgetHeight: 60,
          bottomChild: FadeInDown(
            duration: const Duration(milliseconds: 400),
            child: AddressSearchField(
              topMargin: 0,
              controller: controller.searchController,
              onCloseTap: () {
                FocusManager.instance.primaryFocus?.unfocus();
                controller.searchController.clear();
                controller.searchResultList.clear();
                controller.searchResultList.refresh();
              }, onChanged: (val) {
              if (val.isNotEmpty) {
                controller.debouncer.run(()=> controller.onChanged());
              }
            },
            ),
          ),
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
                  markers: Set<Marker>.of(controller.markers),
                  zoomControlsEnabled: false,
                  onMapCreated: (GoogleMapController googleMapController) {
                    controller.mapController.complete(googleMapController);
                  },
                );
              },
            ),
            const BaseMapHeaderShadow(),
            Obx(()=>Visibility(
                visible: controller.searchResultList.isNotEmpty,
                child: Container(
                  margin: const EdgeInsets.only(
                    right: horizontalScreenPadding,
                    left: horizontalScreenPadding,
                    top: 160,
                    bottom: 5,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: BaseColors.secondaryColor, width: 0.9),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 3,
                            spreadRadius: 1.5,
                            color: BaseColors.secondaryColor.withOpacity(0.4),
                            offset: const Offset(0,2.5)
                        ),
                      ],
                  ),
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.searchResultList.length,
                    itemBuilder: (context, index) {
                      return Obx(()=>Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onTap: (){
                                triggerHapticFeedback();
                                FocusManager.instance.primaryFocus?.unfocus();
                                controller.selectedLocation.value = controller.searchResultList[index];
                                controller.searchController.text = controller.searchResultList[index]["description"];
                                controller.searchResultList.value = [];
                                controller.searchResultList.clear();
                                controller.searchResultList.refresh();
                                print("Search Result List Length: ");
                                print(controller.searchResultList.length.toString());
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: SizedBox(
                                  width: double.infinity,
                                    child: Text(controller.searchResultList[index]["description"])),
                              ),
                            ),
                            Visibility(
                              visible: controller.searchResultList.length != (index+1),
                                child: const Divider(height: 0,
                                ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            )
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
                FocusManager.instance.primaryFocus?.unfocus();
                controller.searchController.clear();
                controller.searchResultList.clear();
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: BaseText(
                          value: widget.mainAddress??"",
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
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
                  BaseText(
                    value: widget.subAddress??"",
                    fontSize: 11.5,
                    color: const Color(0xffFBE6D3),
                    fontWeight: FontWeight.w400,
                  ),
                  BaseButton(
                    title: "Confirm Location",
                    topMargin: 20,
                    bottomMargin: 12,
                    onPressed: (){
                      Get.to(()=> ManageAddressScreen(
                        lat: widget.lat??0,
                        long: widget.long??0,
                        mainAddress: widget.mainAddress??"",
                        subAddress: widget.subAddress??"",
                        fullAddress: widget.fullAddress??"",
                      ));
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
