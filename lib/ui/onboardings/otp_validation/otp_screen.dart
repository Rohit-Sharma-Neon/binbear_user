import 'package:binbear/ui/base_components/animated_column.dart';
import 'package:binbear/ui/base_components/base_app_bar.dart';
import 'package:binbear/ui/base_components/base_button.dart';
import 'package:binbear/ui/base_components/base_container.dart';
import 'package:binbear/ui/base_components/base_scaffold_background.dart';
import 'package:binbear/ui/base_components/base_text.dart';
import 'package:binbear/ui/onboardings/otp_validation/controller/otp_controller.dart';
import 'package:binbear/ui/onboardings/base_success_screen.dart';
import 'package:binbear/utils/base_colors.dart';
import 'package:binbear/utils/base_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:slide_countdown/slide_countdown.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {

  OtpController controller = Get.put(OtpController());

  @override
  Widget build(BuildContext context) {
    return BaseScaffoldBackground(
      child: Scaffold(
        appBar: const BaseAppBar(),
        body: SingleChildScrollView(
          child: AnimatedColumn(
            children: [
              BaseContainer(
                topMargin: 10,
                topPadding: 20,
                bottomPadding: 20,
                child: AnimatedColumn(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const BaseText(
                        value: "OTP Verification",
                        fontSize: 28, fontWeight: FontWeight.w600,
                    ),
                    const SizedBox(height: 10),
                    const BaseText(
                      value: "Please enter the code that was\nsent to your phone number.",
                      textAlign: TextAlign.center,
                      fontSize: 16.4,
                      fontWeight: FontWeight.w700,
                    ),
                    const SizedBox(height: 30),
                    Pinput(
                      controller: controller.otpController,
                      focusedPinTheme: PinTheme(
                        width: 56,
                        height: 56,
                        textStyle: const TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w600),
                        decoration: BoxDecoration(
                          border: Border.all(color: BaseColors.secondaryColor),
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: BaseColors.secondaryColor.withOpacity(0.4), spreadRadius: 1.5, blurRadius: 1.5)
                          ]
                        ),
                      ),
                      defaultPinTheme: PinTheme(
                        width: 56,
                        height: 56,
                        textStyle: const TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w600),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      submittedPinTheme: PinTheme(
                        width: 56,
                        height: 56,
                        textStyle: const TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w600),
                        decoration: BoxDecoration(
                          border: Border.all(color: BaseColors.secondaryColor),
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      onCompleted: (pin) {
                      },
                    ),
                    BaseButton(
                      topMargin: 30,
                      title: "Verify",
                      onPressed: (){
                        controller.callVerifyOtpApi();
                      },
                      bottomMargin: 25,
                    ),
                    SlideCountdownSeparated(
                      key: UniqueKey(),
                      duration: const Duration(seconds: 59),
                      showZeroValue: true,
                      shouldShowHours: (v)=> false,
                      shouldShowDays: (v)=> false,
                      suffixIcon: const Text(" s", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 15)),
                      style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 15),
                      padding: EdgeInsets.zero,
                      decoration: const BoxDecoration(
                        color: Colors.transparent,
                      ),
                      onDone: (){
                        controller.isResendEnable.value = true;
                        },
                    ),
                    const BaseText(
                      topMargin: 20,
                      value: "Didn't receive OTP?",
                      fontSize: 13,
                      color: Color(0xff30302E),
                      fontWeight: FontWeight.w500,
                    ),
                    Obx(()=>BaseText(
                      value: "Resend Code",
                      fontSize: 14,
                      color: controller.isResendEnable.value ? BaseColors.secondaryColor : Colors.grey,
                      fontWeight: FontWeight.w500,
                      onTap: (){
                        if (controller.isResendEnable.value) {
                          triggerHapticFeedback();
                          controller.isResendEnable.value = false;
                          setState(() {});
                        }
                      },
                    ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
