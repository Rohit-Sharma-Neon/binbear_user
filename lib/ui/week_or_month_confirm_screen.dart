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
import 'package:binbear/utils/base_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class WeekOrMonthConfirmScreen extends StatefulWidget {
  final String selectedServiceTitle;
  const WeekOrMonthConfirmScreen({super.key, required this.selectedServiceTitle});

  @override
  State<WeekOrMonthConfirmScreen> createState() => _WeekOrMonthConfirmScreenState();
}

class _WeekOrMonthConfirmScreenState extends State<WeekOrMonthConfirmScreen> {

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
                title: "Can 2 Curb Service",
                bottomMargin: 0,
              ),
              const BasePageSubTitle(
                subTitle: "1x Can2curb service",
                bottomMargin: 0,
              ),
              const BasePageSubTitle(
                topMargin: 13,
                leftMargin: horizontalScreenPadding,
                rightMargin: horizontalScreenPadding,
                subTitle: "Your cans will be placed on your curb during the evening prior to service day or the morning of service day before 6am. Then they will be returned once they are emptied.",
                bottomMargin: 20,
                fontSize: 12,
              ),
              Container(
                height: 85,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: horizontalScreenPadding),
                padding: const EdgeInsets.only(top: 17, bottom: 17, left: 6),
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
                    SvgPicture.asset(BaseAssets.icServiceCalendar),
                    BaseText(
                      value: widget.selectedServiceTitle,
                      fontSize: 16,
                      leftMargin: 7,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
              ),
              BaseContainer(
                topMargin: 15,
                bottomMargin: 0,
                rightMargin: horizontalScreenPadding,
                leftMargin: horizontalScreenPadding,
                leftPadding: horizontalScreenPadding,
                rightPadding: horizontalScreenPadding,
                topPadding: 10,
                bottomPadding: 18,
                borderRadius: 14,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const BaseText(
                      value: "No. of Cans",
                      fontSize: 13,
                      bottomMargin: 8,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                    DropdownButton(
                      value: selectedDropDownValue,
                      style: const TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: cansList.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      isDense: true,
                      isExpanded: true,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedDropDownValue = newValue??"";
                        });
                      },
                    ),
                  ],
                ),
              ),
              const BaseContainer(
                topMargin: 15,
                rightMargin: horizontalScreenPadding,
                leftMargin: horizontalScreenPadding,
                leftPadding: horizontalScreenPadding,
                rightPadding: horizontalScreenPadding,
                topPadding: 10,
                bottomPadding: 12,
                borderRadius: 14,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    BaseText(
                      value: "Payment Amount",
                      fontSize: 14,
                      bottomMargin: 8,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                    BaseText(
                      value: "\$400.00",
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
              Get.off(() => const BasePaymentScreen(payableAmount: '400.00',));
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
