import 'package:binbear/ui/base_components/base_app_bar.dart';
import 'package:binbear/ui/base_components/base_container.dart';
import 'package:binbear/ui/base_components/base_scaffold_background.dart';
import 'package:binbear/ui/base_components/base_text.dart';
import 'package:binbear/ui/base_components/base_text_button.dart';
import 'package:binbear/ui/manual_address/components/address_search_field.dart';
import 'package:binbear/ui/manual_address/components/manual_address_list_tile.dart';
import 'package:binbear/ui/manual_address/controller/manual_address_controller.dart';
import 'package:binbear/ui/map_view/map_view_screen.dart';
import 'package:binbear/utils/base_assets.dart';
import 'package:binbear/utils/base_colors.dart';
import 'package:binbear/utils/base_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ManualAddressScreen extends StatefulWidget {
  const ManualAddressScreen({super.key});

  @override
  State<ManualAddressScreen> createState() => _ManualAddressScreenState();
}

class _ManualAddressScreenState extends State<ManualAddressScreen> {

  ManualAddressController controller = Get.put(ManualAddressController());

  @override
  Widget build(BuildContext context) {
    return BaseScaffoldBackground(
      child: Scaffold(
        appBar: const BaseAppBar(),
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
              AddressSearchField(),
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
                  Get.to(()=> const MapViewScreen());
                },
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: const EdgeInsets.only(left: horizontalScreenPadding, right: 18),
                          itemCount: 3,
                          itemBuilder: (context, index){
                            return const ManualAddressListTile(
                              title: 'Ruby Restaurant & Bar',
                              subtitle: 'Mile Post, 96 NY State Thruway, Ruby, NY 12475, United States',
                            );
                          },
                      ),
                      Container(
                        width: double.infinity,
                        color: BaseColors.tertiaryColor,
                        padding: const EdgeInsets.only(left: horizontalScreenPadding, top: 3, bottom: 3),
                        child: const BaseText(
                          value: "Saved Address",
                          fontSize: 12.5,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.only(left: horizontalScreenPadding, right: 18, top: 8, bottom: 50),
                        itemCount: 3,
                        itemBuilder: (context, index){
                          return const ManualAddressListTile(
                            title: 'Ruby Restaurant & Bar',
                            subtitle: 'Mile Post, 96 NY State Thruway, Ruby, NY 12475, United States',
                            suffixBtnTitle: "Home",
                          );
                        },
                      ),
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
