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
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class MonthTrashCleaningConfirmScreen extends StatefulWidget {
  const MonthTrashCleaningConfirmScreen({super.key});

  @override
  State<MonthTrashCleaningConfirmScreen> createState() => _MonthTrashCleaningConfirmScreenState();
}

class _MonthTrashCleaningConfirmScreenState extends State<MonthTrashCleaningConfirmScreen> {

  String selectedDropDownValue = "2 Cans";
  @override
  Widget build(BuildContext context) {
    return BaseScaffoldBackground(
      child: Scaffold(
        appBar: const BaseAppBar(),
        body: const SingleChildScrollView(
          child: AnimatedColumn(
            children: [
              BasePageTitle(
                topMargin: 0,
                title: "Trash Can Cleaning",
                bottomMargin: 0,
              ),
              BasePageSubTitle(
                subTitle: "You don't have to take your trash cans to the street. We'll collect them, clean them, and return them to your home.",
                bottomMargin: 45,
              ),
              BaseContainer(
                topMargin: 120,
                bottomMargin: 0,
                leftPadding: horizontalScreenPadding,
                rightPadding: horizontalScreenPadding,
                topPadding: 22,
                bottomPadding: 22,
                borderRadius: 14,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BaseText(
                      value: "\$50.00",
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                    BaseText(
                      topMargin: 3,
                      value: "/Month",
                      fontSize: 18,
                      color: Color(0xff707070),
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
              Get.off(() => const BasePaymentScreen(payableAmount: "50",));
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
