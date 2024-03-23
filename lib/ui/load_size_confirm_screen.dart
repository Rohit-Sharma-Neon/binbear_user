import 'package:binbear/ui/base_components/animated_column.dart';
import 'package:binbear/ui/base_components/base_button.dart';
import 'package:binbear/ui/base_components/base_container.dart';
import 'package:binbear/ui/base_components/base_page_sub_title.dart';
import 'package:binbear/ui/base_components/base_page_title.dart';
import 'package:binbear/ui/base_components/base_app_bar.dart';
import 'package:binbear/ui/base_components/base_scaffold_background.dart';
import 'package:binbear/ui/base_components/base_text.dart';
import 'package:binbear/ui/base_payment_screen.dart';
import 'package:binbear/utils/base_assets.dart';
import 'package:binbear/utils/base_colors.dart';
import 'package:binbear/utils/base_functions.dart';
import 'package:binbear/utils/base_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LoadSizeConfirmScreen extends StatefulWidget {
  final String selectedLoadSizeTitle, selectedLoadSizeImage, selectedLoadSizePrice;
  const LoadSizeConfirmScreen({super.key, required this.selectedLoadSizeTitle, required this.selectedLoadSizeImage, required this.selectedLoadSizePrice});

  @override
  State<LoadSizeConfirmScreen> createState() => _LoadSizeConfirmScreenState();
}

class _LoadSizeConfirmScreenState extends State<LoadSizeConfirmScreen> {

  String selectedDropDownValue = "2 Cans";
  @override
  Widget build(BuildContext context) {
    return BaseScaffoldBackground(
      child: Scaffold(
        appBar: const BaseAppBar(),
        body: SingleChildScrollView(
          child: AnimatedColumn(
            children: [
              const BasePageTitle(
                topMargin: 0,
                title: "Bulk Trash Pickup",
                bottomMargin: 0,
              ),
              const BasePageSubTitle(
                subTitle: "Please upload 3 photos of the trash you would like to picked-up",
                bottomMargin: 45,
              ),
              GestureDetector(
                onTap: (){
                  triggerHapticFeedback();
                },
                child: Container(
                  height: 85,
                  width: double.infinity,
                  padding: const EdgeInsets.only(top: 17, bottom: 17, left: 19),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: Colors.white,
                    border: Border.all(
                      width: 2.5,
                      color: BaseColors.secondaryColor,
                    ),
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 4,
                        blurRadius: 4,
                        offset: const Offset(0,4),
                        color: BaseColors.primaryColor.withOpacity(0.8),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        widget.selectedLoadSizeImage,
                        height: 45,
                      ),
                      BaseText(
                        value: widget.selectedLoadSizeTitle,
                        fontSize: 16,
                        leftMargin: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                ),
              ),
              BaseContainer(
                topMargin: 15,
                bottomMargin: 0,
                leftPadding: horizontalScreenPadding,
                rightPadding: horizontalScreenPadding,
                topPadding: 20,
                bottomPadding: 20,
                borderRadius: 14,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                        BaseAssets.icUpload,
                    ),
                    const BaseText(
                      value: "Upload a picture",
                      fontSize: 14,
                      leftMargin: 8,
                      color: BaseColors.secondaryColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
              ),
              BaseContainer(
                topMargin: 15,
                leftPadding: horizontalScreenPadding,
                rightPadding: horizontalScreenPadding,
                topPadding: 10,
                bottomPadding: 12,
                borderRadius: 14,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const BaseText(
                      value: "Payment Amount",
                      fontSize: 14,
                      bottomMargin: 8,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                    BaseText(
                      value: "\$${widget.selectedLoadSizePrice}",
                      fontSize: 32,
                      bottomMargin: 0,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(horizontal: horizontalScreenPadding, vertical: 14),
          width: double.infinity,
          color: Colors.white,
          child: BaseButton(
            title: 'Confirm & Pay',
            onPressed: (){
              Get.off(() => BasePaymentScreen(payableAmount: widget.selectedLoadSizePrice,));
            },
          ),
        ),
      ),
    );
  }

  List<String> cansList = [
    "1 Can",
    "2 Cans",
    "3 Cans",
  ];
}
