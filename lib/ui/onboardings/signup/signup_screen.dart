import 'package:binbear/ui/base_components/animated_column.dart';
import 'package:binbear/ui/base_components/base_app_bar.dart';
import 'package:binbear/ui/base_components/base_button.dart';
import 'package:binbear/ui/base_components/base_container.dart';
import 'package:binbear/ui/base_components/base_scaffold_background.dart';
import 'package:binbear/ui/base_components/base_text.dart';
import 'package:binbear/ui/base_components/base_textfield.dart';
import 'package:binbear/ui/onboardings/otp_validation/otp_screen.dart';
import 'package:binbear/ui/onboardings/signup/controller/signup_controller.dart';
import 'package:binbear/utils/base_assets.dart';
import 'package:binbear/utils/base_colors.dart';
import 'package:binbear/utils/base_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  SignUpController controller = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return BaseScaffoldBackground(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: const BaseAppBar(),
        body: SingleChildScrollView(
          child: AnimatedColumn(
            children: [
              const SizedBox(height: 52),
              Hero(
                tag: "splash_tag",
                child: SvgPicture.asset(
                  BaseAssets.appLogoWithName,
                  width: 90,
                ),
              ),
              BaseContainer(
                topMargin: 26,
                child: AnimatedColumn(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const BaseText(
                        value: "Let’s Get Started!",
                        textAlign: TextAlign.center, 
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: BaseColors.primaryColor
                    ),
                    const BaseText(
                      topMargin: 4,
                      value: "Create an account by filling in the\ninformation below",
                      fontWeight: FontWeight.w700,
                    ),
                    BaseTextField(
                      topMargin: 16,
                      controller: TextEditingController(),
                      labelText: 'Name',
                      hintText: 'Enter Full Name',
                      textInputType: TextInputType.name,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(right: 13),
                        child: SvgPicture.asset(BaseAssets.icPerson),
                      ),
                    ),
                    BaseTextField(
                      topMargin: 12,
                      controller: TextEditingController(),
                      labelText: 'Email Address',
                      hintText: 'Email Address',
                      textInputType: TextInputType.emailAddress,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(right: 13),
                        child: SvgPicture.asset(BaseAssets.icEmail),
                      ),
                    ),
                    BaseTextField(
                      topMargin: 12,
                      controller: TextEditingController(),
                      labelText: 'Enter Mobile Number',
                      hintText: 'Mobile Number',
                      textInputType: TextInputType.phone,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(right: 13),
                        child: SvgPicture.asset(BaseAssets.icPhone),
                      ),
                    ),
                    BaseTextField(
                      topMargin: 14,
                      controller: TextEditingController(),
                      labelText: 'Password',
                      hintText: 'Enter Password',
                      textInputType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.next,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(right: 13),
                        child: SvgPicture.asset(BaseAssets.icLock),
                      ),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(left: 3),
                        child: SvgPicture.asset(BaseAssets.icEyeCrossed),
                      ),
                    ),
                    BaseTextField(
                      topMargin: 14,
                      controller: TextEditingController(),
                      labelText: 'Confirm password',
                      hintText: 'Enter Password Again',
                      textInputType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.done,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(right: 13),
                        child: SvgPicture.asset(BaseAssets.icLock),
                      ),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(left: 3),
                        child: SvgPicture.asset(BaseAssets.icEyeCrossed),
                      ),
                    ),
                    BaseButton(
                      topMargin: 24,
                      title: "Sign up",
                      onPressed: (){
                        Get.to(()=> const OtpScreen());
                      },
                    ),
                    GestureDetector(
                      onTap: (){
                        triggerHapticFeedback();
                        Get.back();
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          BaseText(
                            topMargin: 25,
                            value: "Already have an account?",
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            rightMargin: 2.5,
                          ),
                          BaseText(
                            topMargin: 25,
                            leftMargin: 2.5,
                            value: "Login",
                            fontSize: 13,
                            color: BaseColors.secondaryColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
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
