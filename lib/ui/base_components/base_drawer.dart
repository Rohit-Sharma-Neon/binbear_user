import 'package:binbear/ui/about_app/about_app_screen.dart';
import 'package:binbear/ui/base_components/base_dummy_profile.dart';
import 'package:binbear/ui/base_components/base_text.dart';
import 'package:binbear/ui/base_components/base_text_button.dart';
import 'package:binbear/ui/contact_us/contact_us_screen.dart';
import 'package:binbear/ui/dashboard_module/dashboard_screen/controller/dashboard_controller.dart';
import 'package:binbear/ui/help_&_support/help_&_support_screen.dart';
import 'package:binbear/ui/introductory/introductory_screen.dart';
import 'package:binbear/ui/onboardings/welcome_screen.dart';
import 'package:binbear/utils/base_assets.dart';
import 'package:binbear/utils/get_storage.dart';
import 'package:binbear/utils/storage_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class BaseDrawer extends StatelessWidget {
  const BaseDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width/1.3,
      height: double.infinity,
      padding: const EdgeInsets.only(top: 35, bottom: 50),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
        ),
        color: Colors.white,
      ),
      child: Column(
        children: [
          BaseStorage.read(StorageKeys.profilePhoto).toString().isNotEmpty ? ClipRRect(
            borderRadius: BorderRadius.circular(90),
            child: Image.network(BaseStorage.read(StorageKeys.profilePhoto), width: 100, height: 100, fit: BoxFit.fill),
          ) : const BaseDummyProfile(overflowHeight: 150, overflowWidth: 205, topMargin: 10),
          BaseText(
            topMargin: 15,
            value: BaseStorage.read(StorageKeys.userName),
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
          const Divider(thickness: 0.6, color: Colors.grey, height: 35),
          drawerListTiles(
            title: 'Our Story',
            onTap: () {},
          ),
          drawerListTiles(
            title: 'Contact Us',
            onTap: () {
              Get.to(() => const ContactUsScreen());
            },
          ),
          drawerListTiles(
            title: 'Introductory Videos',
            onTap: () {
              Get.to(() => const IntroductoryScreen());
            },
          ),
          drawerListTiles(
            title: 'Help & Support',
            onTap: () {
              Get.to(() => const HelpSupportScreen());
            },
          ),
          drawerListTiles(
            title: 'Privacy Policy',
            onTap: () {
              Get.to(() => const AboutAppScreen(type: "Privacy Policy"));
            },
          ),
          drawerListTiles(
            title: 'Terms & Conditions',
            onTap: () {
              Get.to(() => const AboutAppScreen(type: "Terms & Conditions"));
            },
          ),
          drawerListTiles(
            title: 'About Us',
            onTap: () {
              Get.to(() => const AboutAppScreen(type: "About Us"));
            },
          ),

          const Spacer(),
          drawerListTiles(
            title: 'Log Out',
            onTap: () {
              BaseStorage.remove(StorageKeys.apiToken);
              Get.offAll(() => const WelcomeScreen());
            },
          ),
        ],
      ),
    );
  }

  Widget drawerListTiles({required String title, required void Function()? onTap}){
    return BaseTextButton(
      btnHeight: 55,
      borderRadius: 0,
      btnPadding: const EdgeInsets.only(left: 0),
      onPressed: (){
        Get.find<DashboardController>().scaffoldKey.currentState?.closeDrawer();
        onTap!();
      },
      child: Row(
        children: [
          const SizedBox(width: 18),
          SvgPicture.asset(BaseAssets.icArrowRight),
          BaseText(
            leftMargin: 18,
            value: title,
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ],
      ),
    );
  }
}
