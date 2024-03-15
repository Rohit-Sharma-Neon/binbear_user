import 'package:binbear/ui/base_components/animated_column.dart';
import 'package:binbear/ui/base_components/base_app_bar.dart';
import 'package:binbear/ui/base_components/base_button.dart';
import 'package:binbear/ui/base_components/base_container.dart';
import 'package:binbear/ui/base_components/base_scaffold_background.dart';
import 'package:binbear/ui/base_components/base_text.dart';
import 'package:binbear/ui/profile_tab/controller/profile_controller.dart';
import 'package:binbear/ui/profile_tab/edit_profile_screen.dart';
import 'package:binbear/ui/settings/settings_screen.dart';
import 'package:binbear/utils/base_assets.dart';
import 'package:binbear/utils/base_colors.dart';
import 'package:binbear/utils/base_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {

  ProfileController controller = Get.put(ProfileController());
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BaseScaffoldBackground(
      child: Scaffold(
        appBar: const BaseAppBar(
          title: "My Account",
          showNotification: true,
          showDrawerIcon: true,
        ),
        body: BaseContainer(
          topMargin: 10,
          bottomMargin: 20,
          height: Get.height,
          rightMargin: horizontalScreenPadding,
          leftMargin: horizontalScreenPadding,
          child: SingleChildScrollView(
            child: AnimatedColumn(
              children: [
                Hero(
                  tag: "profile_image",
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(90),
                    child: Image.asset(
                      "assets/delete/dummy_profile.jpeg", width: 120, height: 120, fit: BoxFit.fill),
                  ),
                ),
                const BaseText(
                  topMargin: 15,
                  value: "Rohit Sharma",
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
                BaseContainer(
                  topMargin: 15,
                  bottomMargin: 0,
                  border: Border.all(color: BaseColors.tertiaryColor, width: 1),
                  borderRadius: 17,
                  leftPadding: 20,
                  rightPadding: 20,
                  boxShadow: BoxShadow(color: Colors.black.withOpacity(0.12), spreadRadius: 1, blurRadius: 7, offset: const Offset(0, 4)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 1),
                        child: SvgPicture.asset(BaseAssets.icEmail, width: 18, height: 18,),
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BaseText(
                            topMargin: 0,
                            leftMargin: 8,
                            value: "Email Address",
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                          BaseText(
                            topMargin: 3,
                            leftMargin: 8,
                            value: "rohitsharma@gmail.com",
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                BaseContainer(
                  topMargin: 20,
                  bottomMargin: 0,
                  border: Border.all(color: BaseColors.tertiaryColor, width: 1),
                  borderRadius: 17,
                  leftPadding: 20,
                  rightPadding: 20,
                  boxShadow: BoxShadow(color: Colors.black.withOpacity(0.12), spreadRadius: 1, blurRadius: 7, offset: const Offset(0, 4)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 1),
                        child: SvgPicture.asset(BaseAssets.icPhone, width: 18, height: 18,),
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BaseText(
                            topMargin: 0,
                            leftMargin: 8,
                            value: "Mobile Number",
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                          BaseText(
                            topMargin: 3,
                            leftMargin: 8,
                            value: "+1 0231456987",
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                BaseButton(
                  topMargin: 20,
                  btnHeight: 60,
                  title: "Edit Profile",
                  btnColor: BaseColors.secondaryColor,
                  onPressed: (){
                    Get.to(() => const EditProfileScreen());
                  },
                ),
                BaseButton(
                  topMargin: 20,
                  btnHeight: 60,
                  title: "Settings",
                  onPressed: (){
                    Get.to(() => const SettingsScreen());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
