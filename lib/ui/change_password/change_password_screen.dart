import 'package:binbear/ui/base_components/animated_column.dart';
import 'package:binbear/ui/base_components/base_app_bar.dart';
import 'package:binbear/ui/base_components/base_button.dart';
import 'package:binbear/ui/base_components/base_container.dart';
import 'package:binbear/ui/base_components/base_scaffold_background.dart';
import 'package:binbear/ui/base_components/base_text.dart';
import 'package:binbear/ui/base_components/base_textfield.dart';
import 'package:binbear/ui/onboardings/welcome_screen.dart';
import 'package:binbear/utils/base_assets.dart';
import 'package:binbear/utils/base_colors.dart';
import 'package:binbear/utils/base_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  bool isNotificationEnable = false;

  @override
  Widget build(BuildContext context) {
    return BaseScaffoldBackground(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: const BaseAppBar(),
        body: AnimatedColumn(
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
              child: Column(
                children: [
                  BaseTextField(
                    topMargin: 14,
                    controller: TextEditingController(),
                    labelText: 'Old Password',
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
                    labelText: 'New Password',
                    hintText: 'Enter New Password',
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
                    labelText: 'Confirm Password',
                    hintText: 'Enter Password Again',
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
                  BaseButton(
                    topMargin: 30,
                    title: "Save",
                    onPressed: (){

                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
