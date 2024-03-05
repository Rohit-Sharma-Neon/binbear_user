import 'package:binbear/ui/base_components/animated_column.dart';
import 'package:binbear/ui/base_components/base_app_bar.dart';
import 'package:binbear/ui/base_components/base_button.dart';
import 'package:binbear/ui/base_components/base_container.dart';
import 'package:binbear/ui/base_components/base_scaffold_background.dart';
import 'package:binbear/ui/base_components/base_text.dart';
import 'package:binbear/ui/onboardings/location/onboarding_location_screen.dart';
import 'package:binbear/utils/base_assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BaseSuccessScreen extends StatelessWidget {
  final String? description, btnTitle;
  final void Function()? onBtnTap;
  const BaseSuccessScreen({super.key, this.description, this.btnTitle, this.onBtnTap});

  @override
  Widget build(BuildContext context) {
    return BaseScaffoldBackground(
      child: Scaffold(
        appBar: const BaseAppBar(),
        body: SingleChildScrollView(
          child: AnimatedColumn(
            children: [
              BaseContainer(
                topPadding: 55,
                child: AnimatedColumn(
                  children: [
                    Image.asset(
                      BaseAssets.icSignUpSuccess,
                      width: 180,
                      height: 180,
                      fit: BoxFit.fitHeight,
                    ),
                    const BaseText(
                      value: "Welcome Jeck!",
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                    BaseText(
                      topMargin: 5,
                      value: description??"You have successfully created\nyour BinBear account! You can\nnow access your account and\nschedule services.",
                      fontSize: 15,
                      textAlign: TextAlign.center,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                    BaseButton(
                      topMargin: 35,
                      title: btnTitle??"Homepage",
                      onPressed: onBtnTap ?? (){
                        Get.off(() => OnboardingLocationScreen());
                      },
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
