import 'package:binbear/ui/base_components/animated_column.dart';
import 'package:binbear/ui/base_components/base_app_bar.dart';
import 'package:binbear/ui/base_components/base_button.dart';
import 'package:binbear/ui/base_components/base_container.dart';
import 'package:binbear/ui/base_components/base_scaffold_background.dart';
import 'package:binbear/ui/base_components/base_text.dart';
import 'package:binbear/ui/manual_address/manual_address_screen.dart';
import 'package:binbear/ui/onboardings/location/controller/onboarding_location_controller.dart';
import 'package:binbear/ui/onboardings/splash/controller/base_controller.dart';
import 'package:binbear/utils/base_assets.dart';
import 'package:binbear/utils/base_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingLocationScreen extends StatelessWidget {
  OnboardingLocationScreen({super.key});

  final OnBoardingLocationController controller = Get.put(OnBoardingLocationController());
  final BaseController baseController = Get.find<BaseController>();

  @override
  Widget build(BuildContext context) {
    return BaseScaffoldBackground(
      child: Scaffold(
        appBar: const BaseAppBar(),
        body: SingleChildScrollView(
          child: AnimatedColumn(
            children: [
              BaseContainer(
                topPadding: 20,
                child: AnimatedColumn(
                  children: [
                    Image.asset(
                      BaseAssets.icLocation,
                      width: 210,
                      height: 210,
                      fit: BoxFit.fitHeight,
                    ),
                    const BaseText(
                      value: "Address",
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                    const BaseText(
                      topMargin: 10,
                      value: "Please allow us to fetch your\nlocation, or you can add your\nlocation manually.",
                      fontSize: 15,
                      textAlign: TextAlign.center,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                    BaseButton(
                      topMargin: 35,
                      title: "Enable Location",
                      btnColor: BaseColors.secondaryColor,
                      onPressed: (){
                        baseController.getCurrentLocation();
                      },
                    ),
                    BaseButton(
                      topMargin: 18,
                      title: "Add Location Manually",
                      onPressed: (){
                        Get.to(() => const ManualAddressScreen());
                      },
                    ),
                    // const BaseTextButton(
                    //   topMargin: 12,
                    //   title: "Skip",
                    // ),
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
