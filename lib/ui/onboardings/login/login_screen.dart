import 'package:binbear/ui/base_components/animated_column.dart';
import 'package:binbear/ui/base_components/base_button.dart';
import 'package:binbear/ui/base_components/base_container.dart';
import 'package:binbear/ui/base_components/base_form_field_validator_icon.dart';
import 'package:binbear/ui/base_components/base_scaffold_background.dart';
import 'package:binbear/ui/base_components/base_text.dart';
import 'package:binbear/ui/base_components/base_text_button.dart';
import 'package:binbear/ui/base_components/base_textfield.dart';
import 'package:binbear/ui/dashboard_module/dashboard_screen/dashboard_screen.dart';
import 'package:binbear/ui/onboardings/forgot_password/forgot_password_screen.dart';
import 'package:binbear/ui/onboardings/login/controller/login_controller.dart';
import 'package:binbear/utils/base_assets.dart';
import 'package:binbear/utils/base_colors.dart';
import 'package:binbear/utils/base_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return BaseScaffoldBackground(
      child: Scaffold(
        body: SingleChildScrollView(
          child: AnimatedColumn(
            children: [
              const SizedBox(height: 70),
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const BaseText(
                        value: "Welcome to",
                        textAlign: TextAlign.center,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        height: 1.5
                    ),
                    Image.asset(BaseAssets.binBearTextLogo, width: 70,),
                    GetBuilder<LoginController>(
                      builder: (LoginController controller) {
                        return BaseTextField(
                          topMargin: 12,
                          controller: controller.emailController,
                          hintText: 'Email Address',
                          labelText: 'Email Address',
                          textInputType: TextInputType.emailAddress,
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(right: 13),
                            child: SvgPicture.asset(BaseAssets.icEmail),
                          ),
                          suffixIcon: BaseFormFieldValidatorIcon(
                            textEditingController: controller.emailController,
                            failedOn: !GetUtils.isEmail(controller.emailController.text),
                          ),
                          onChanged: (val){
                            controller.update();
                          },
                        );
                      },
                    ),
                    GetBuilder<LoginController>(
                      builder: (LoginController controller) {
                        return BaseTextField(
                          topMargin: 14,
                          controller: controller.passwordController,
                          labelText: 'Password',
                          hintText: 'Enter Password',
                          textInputType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.done,
                          onChanged: (val){
                            controller.update();
                          },
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(right: 13),
                            child: SvgPicture.asset(BaseAssets.icLock),
                          ),
                          suffixIcon: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              GestureDetector(
                                onTap: (){
                                  triggerHapticFeedback();
                                  controller.obscurePassword = !(controller.obscurePassword);
                                  controller.update();
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 3),
                                  child: controller.obscurePassword ? const Icon(Icons.visibility_off, size: 24) : const Icon(Icons.visibility, size: 24),
                                ),
                              ),
                              BaseFormFieldValidatorIcon(
                                leftMargin: 6,
                                textEditingController: controller.passwordController,
                                failedOn: controller.passwordController.text.length < 8,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    BaseButton(
                      topMargin: 24,
                      title: "Login",
                      onPressed: (){
                        if(controller.emailController.text.isEmpty){
                          showSnackBar(subtitle: "Please Enter Email");
                        }else if (!GetUtils.isEmail(controller.emailController.text)) {
                          showSnackBar(subtitle: "Please Enter Valid Email");
                        }else if (controller.passwordController.text.isEmpty) {
                          showSnackBar(subtitle: "Please Enter Password");
                        }else if (controller.passwordController.text.length < 8) {
                          showSnackBar(subtitle: "Password Length Can't Be Less Than 8");
                        }else{
                          controller.getResponse();
                        }
                      },
                    ),
                    BaseTextButton(
                      title: "Forgot Password?",
                      bottomMargin: 15,
                      onPressed: (){
                        Get.to(const ForgotPasswordScreen());
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
                            value: "Don’t have an account?",
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            rightMargin: 2.5,
                          ),
                          BaseText(
                            leftMargin: 2.5,
                            value: "Sign up",
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
