import 'package:binbear/ui/base_components/animated_column.dart';
import 'package:binbear/ui/base_components/base_app_bar.dart';
import 'package:binbear/ui/base_components/base_button.dart';
import 'package:binbear/ui/base_components/base_container.dart';
import 'package:binbear/ui/base_components/base_page_title.dart';
import 'package:binbear/ui/base_components/base_scaffold_background.dart';
import 'package:binbear/ui/base_components/base_text.dart';
import 'package:binbear/ui/base_components/base_textfield.dart';
import 'package:binbear/ui/onboardings/base_success_screen.dart';
import 'package:binbear/utils/base_assets.dart';
import 'package:binbear/utils/base_sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BasePaymentScreen extends StatefulWidget {
  final String payableAmount;
  const BasePaymentScreen({super.key, required this.payableAmount});

  @override
  State<BasePaymentScreen> createState() => _BasePaymentScreenState();
}

class _BasePaymentScreenState extends State<BasePaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffoldBackground(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: const BaseAppBar(),
        body: SingleChildScrollView(
          child: AnimatedColumn(
            children: [
              const BasePageTitle(
                title: "Make Payment",
              ),
              const BaseContainer(
                topMargin: 15,
                rightMargin: horizontalScreenPadding,
                leftMargin: horizontalScreenPadding,
                leftPadding: horizontalScreenPadding,
                rightPadding: horizontalScreenPadding,
                topPadding: 10,
                bottomMargin: 0,
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
              BaseContainer(
                topMargin: 15,
                leftPadding: horizontalScreenPadding,
                rightPadding: horizontalScreenPadding,
                topPadding: 25,
                bottomPadding: 30,
                // borderRadius: 14,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 45),
                      child: Image.asset(BaseAssets.icCreditCards),
                    ),
                    BaseTextField(
                      topMargin: 30,
                      controller: TextEditingController(),
                      labelText: "Name on Card",
                      hintText: "Enter Name",
                      textInputType: TextInputType.name,
                    ),
                    BaseTextField(
                      topMargin: 15,
                      controller: TextEditingController(),
                      labelText: "Card Number",
                      hintText: "Enter Card Number",
                      textInputType: TextInputType.number,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: BaseTextField(
                            topMargin: 15,
                            rightMargin: 10,
                            controller: TextEditingController(),
                            labelText: "Expiry Date",
                            hintText: "MM/YY",
                            textInputType: TextInputType.datetime,
                          ),
                        ),
                        Expanded(
                          child: BaseTextField(
                            topMargin: 15,
                            leftMargin: 10,
                            controller: TextEditingController(),
                            labelText: "Security Code",
                            hintText: "CVV",
                            textInputType: TextInputType.number,
                          ),
                        ),
                      ],
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
            title: 'Pay Now',
            onPressed: (){
              Get.off(() => BaseSuccessScreen(
                description: "Wow! Thank You For Allowing Binbear The Opportunity To Help Make Your Life Easier.",
                btnTitle: "Done",
                onBtnTap: (){
                  Get.back();
                },
              ));
            },
          ),
        ),
      ),
    );
  }
}
