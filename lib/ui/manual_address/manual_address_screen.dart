import 'package:binbear/ui/base_components/base_app_bar.dart';
import 'package:binbear/ui/base_components/base_google_address_shimmer.dart';
import 'package:binbear/ui/base_components/base_scaffold_background.dart';
import 'package:binbear/ui/manual_address/controller/manual_address_controller.dart';
import 'package:binbear/ui/map_view/controller/map_view_controller.dart';
import 'package:binbear/ui/map_view/map_view_screen.dart';
import 'package:binbear/ui/onboardings/splash/controller/base_controller.dart';
import 'package:binbear/utils/base_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../utils/base_assets.dart';
import '../../utils/base_colors.dart';
import '../base_components/base_container.dart';
import '../base_components/base_text.dart';
import '../base_components/base_text_button.dart';
import 'components/address_search_field.dart';
import 'components/manual_address_list_tile.dart';

class ManualAddressScreen extends StatefulWidget {
  const ManualAddressScreen({super.key});

  @override
  State<ManualAddressScreen> createState() => _ManualAddressScreenState();
}

class _ManualAddressScreenState extends State<ManualAddressScreen> {

  ManualAddressController controller = Get.put(ManualAddressController());
  MapViewController mapViewController = Get.put(MapViewController());
  BaseController baseController = Get.find<BaseController>();

  @override
  Widget build(BuildContext context) {
    return BaseScaffoldBackground(
      child: Scaffold(
        appBar: const BaseAppBar(
          fontWeight: FontWeight.w400,
          showDrawerIcon: false,
        ),
        body: BaseContainer(
          topMargin: 10,
          leftPadding: 0,
          rightPadding: 0,
          bottomPadding: 10,
          leftMargin: horizontalScreenPadding,
          rightMargin: horizontalScreenPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AddressSearchField(
                controller: TextEditingController(),
                onCloseTap: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  baseController.searchController.clear();
                  baseController.searchResultList.clear();
                  baseController.searchResultList.refresh();
                  baseController.isAddressSuggestionLoading.value = false;
                  setState(() {});
                },
                onChanged: (val) {
                  baseController.getSuggestionsList(val);
                },
              ),
              BaseTextButton(
                topMargin: 7,
                btnPadding: const EdgeInsets.only(left: 18, top: 10, bottom: 10),
                child: Row(
                  children: [
                    SvgPicture.asset(BaseAssets.icLocate, width: 23, height: 23),
                    const SizedBox(width: 8),
                    const BaseText(
                      value: "Use Current Location",
                      fontSize: 14,
                      color: BaseColors.secondaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
                onPressed: (){
                  controller.locateToCurrentLocation();
                },
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Obx(()=> baseController.isAddressSuggestionLoading.value ? const BaseGoogleAddressShimmer(itemCount: 5) : baseController.searchResultList.isNotEmpty ?
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.only(left: horizontalScreenPadding, right: 18),
                        itemCount: baseController.searchResultList.length,
                        itemBuilder: (context, index){
                          return GestureDetector(
                            onTap: () async {
                              await baseController.getLatLngFromPlaceId(address: baseController.searchResultList[index].description??"").then((value) {
                                Get.to(()=> MapViewScreen(
                                  lat: value?.latitude??0,
                                  long: value?.longitude??0,
                                  fullAddress: baseController.searchResultList[index].description,
                                  mainAddress: baseController.searchResultList[index].description.toString().split(",").first,
                                  subAddress: baseController.searchResultList[index].description.toString().replaceAll("${baseController.searchResultList[index].description.toString().split(",").first}, ", ""),
                                ));
                              });
                            },
                            child: ManualAddressListTile(
                              title: baseController.searchResultList[index].description.toString().split(",").first,
                              subtitle: baseController.searchResultList[index].description.toString().replaceAll("${baseController.searchResultList[index].description.toString().split(",").first}, ", ""),
                            ),
                          );
                          },
                        ) : const BaseText(
                        topMargin: 20,
                        value: "Search Result Will Appear Here.",
                        fontSize: 14,
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                        bottomMargin: 18,
                        ),
                      ),
                      // Container(
                      //   width: double.infinity,
                      //   color: BaseColors.tertiaryColor,
                      //   padding: const EdgeInsets.only(left: horizontalScreenPadding, top: 3, bottom: 3),
                      //   child: const BaseText(
                      //     value: "Saved Address",
                      //     fontSize: 12.5,
                      //     color: Colors.black,
                      //     fontWeight: FontWeight.w500,
                      //   ),
                      // ),
                      // ListView.builder(
                      //   shrinkWrap: true,
                      //   physics: const NeverScrollableScrollPhysics(),
                      //   padding: const EdgeInsets.only(left: horizontalScreenPadding, right: 18, top: 8, bottom: 50),
                      //   itemCount: 3,
                      //   itemBuilder: (context, index){
                      //     return const ManualAddressListTile(
                      //       title: 'Ruby Restaurant & Bar',
                      //       subtitle: 'Mile Post, 96 NY State Thruway, Ruby, NY 12475, United States',
                      //       suffixBtnTitle: "Home",
                      //     );
                      //   },
                      // ),
                    ],
                  ),
                ),
              ),
              const BaseText(
                value: "Powered By Google",
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.w400,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
