import 'package:binbear/ui/base_components/animated_column.dart';
import 'package:binbear/ui/base_components/base_app_bar.dart';
import 'package:binbear/ui/base_components/base_button.dart';
import 'package:binbear/ui/base_components/base_container.dart';
import 'package:binbear/ui/base_components/base_form_field_validator_icon.dart';
import 'package:binbear/ui/base_components/base_scaffold_background.dart';
import 'package:binbear/ui/base_components/base_text.dart';
import 'package:binbear/ui/base_components/base_textfield.dart';
import 'package:binbear/ui/change_password/controller/change_password_controller.dart';
import 'package:binbear/utils/base_assets.dart';
import 'package:binbear/utils/base_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  ChangePasswordController controller = Get.put(ChangePasswordController());
  @override
  Widget build(BuildContext context) {
    return BaseScaffoldBackground(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: const BaseAppBar(),
        body: SingleChildScrollView(
          child: AnimatedColumn(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const BaseText(
                topMargin: 75,
                value: "Change Password",
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
              const BaseText(
                topMargin: 10,
                value: "Lorem ipsum is a dummy text",
                fontSize: 14,
                color: Color(0xffFBE6D3),
                fontWeight: FontWeight.w500,
              ),
              BaseContainer(
                topMargin: 20,
                borderRadius: 14,
                leftPadding: 22,
                rightPadding: 22,
                bottomMargin: 22,
                child: GetBuilder<ChangePasswordController>(
                  builder: (ChangePasswordController controller) {
                    return Column(
                      children: [
                        BaseTextField(
                          topMargin: 14,
                          controller: controller.oldPasswordController,
                          labelText: 'Old Password',
                          hintText: 'Enter Password',
                          obscureText: controller.obscureOldPassword,
                          textInputType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.next,
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
                                  controller.obscureOldPassword = !(controller.obscureOldPassword);
                                  controller.update();
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 3),
                                  child: controller.obscureOldPassword ? const Icon(Icons.visibility_off, size: 24) : const Icon(Icons.visibility, size: 24),
                                ),
                              ),
                              BaseFormFieldValidatorIcon(
                                leftMargin: 6,
                                textEditingController: controller.oldPasswordController,
                                failedOn: controller.oldPasswordController.text.length < 8,
                              ),
                            ],
                          ),
                          onChanged: (val){
                            controller.update();
                          },
                        ),
                        BaseTextField(
                          topMargin: 14,
                          controller: controller.newPasswordController,
                          labelText: 'New Password',
                          hintText: 'Enter New Password',
                          textInputType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.next,
                          obscureText: controller.obscureNewPassword,
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
                                  controller.obscureNewPassword = !(controller.obscureNewPassword);
                                  controller.update();
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 3),
                                  child: controller.obscureNewPassword ? const Icon(Icons.visibility_off, size: 24) : const Icon(Icons.visibility, size: 24),
                                ),
                              ),
                              BaseFormFieldValidatorIcon(
                                leftMargin: 6,
                                textEditingController: controller.newPasswordController,
                                failedOn: controller.newPasswordController.text.length < 8,
                              ),
                            ],
                          ),
                          onChanged: (val){
                            controller.update();
                          },
                        ),
                        BaseTextField(
                          topMargin: 14,
                          controller: controller.confirmPasswordController,
                          obscureText: controller.obscureConfirmPassword,
                          labelText: 'Confirm Password',
                          hintText: 'Enter Password Again',
                          textInputType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.next,
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
                                  controller.obscureConfirmPassword = !(controller.obscureConfirmPassword);
                                  controller.update();
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 3),
                                  child: controller.obscureConfirmPassword ? const Icon(Icons.visibility_off, size: 24) : const Icon(Icons.visibility, size: 24),
                                ),
                              ),
                              BaseFormFieldValidatorIcon(
                                leftMargin: 6,
                                textEditingController: controller.confirmPasswordController,
                                failedOn: controller.confirmPasswordController.text != controller.newPasswordController.text || controller.confirmPasswordController.text.length < 8,
                              ),
                            ],
                          ),
                          onChanged: (val){
                            controller.update();
                          },
                        ),
                        BaseButton(
                          topMargin: 30,
                          title: "Save",
                          onPressed: (){
                            if (controller.oldPasswordController.text.trim().isEmpty) {
                              showSnackBar(subtitle: "Please Enter Old Password");
                            }else if (controller.oldPasswordController.text.trim().length < 8) {
                              showSnackBar(subtitle: "Please Enter Valid Old Password");
                            }else if (controller.newPasswordController.text.trim().isEmpty) {
                              showSnackBar(subtitle: "Please Enter New Password");
                            }else if (controller.newPasswordController.text.trim().length < 8) {
                              showSnackBar(subtitle: "New Password Length Can't Be Less Than 8");
                            }else if (controller.confirmPasswordController.text.trim().isEmpty) {
                              showSnackBar(subtitle: "Please Enter Confirm Password");
                            }else if (controller.confirmPasswordController.text.trim() != controller.newPasswordController.text.trim()) {
                              showSnackBar(subtitle: "Confirm Password Is Not Matching, Please Check");
                            }else{
                              controller.changePassword();
                            }
                          },
                        )
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
