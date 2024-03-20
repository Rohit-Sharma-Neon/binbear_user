import 'package:binbear/ui/base_components/animated_column.dart';
import 'package:binbear/ui/base_components/base_app_bar.dart';
import 'package:binbear/ui/base_components/base_button.dart';
import 'package:binbear/ui/base_components/base_container.dart';
import 'package:binbear/ui/base_components/base_dummy_profile.dart';
import 'package:binbear/ui/base_components/base_scaffold_background.dart';
import 'package:binbear/ui/base_components/base_shimmer.dart';
import 'package:binbear/ui/base_components/base_text.dart';
import 'package:binbear/ui/profile_tab/controller/profile_controller.dart';
import 'package:binbear/ui/profile_tab/edit_profile_screen.dart';
import 'package:binbear/ui/settings/settings_screen.dart';
import 'package:binbear/utils/base_assets.dart';
import 'package:binbear/utils/base_colors.dart';
import 'package:binbear/utils/base_variables.dart';
import 'package:card_loading/card_loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

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
          child: SmartRefresher(
            controller: controller.refreshController,
            header: const WaterDropHeader(waterDropColor: BaseColors.primaryColor),
            onRefresh: (){
              controller.getProfileData();
            },
            child: SingleChildScrollView(
              child: AnimatedColumn(
                children: [
                  Hero(
                    tag: "profile_image",
                    child: Obx(()=> controller.isProfileLoading.value ?
                    const BaseShimmer(width: 118, height: 118, borderRadius: 99) :
                        (controller.profileData?.value?.profile??"").toString().isEmpty ?
                        const BaseDummyProfile(overflowHeight: 150, overflowWidth: 205, topMargin: 10,) :
                        Image.network(controller.profileData?.value?.profile??"", width: 118, height: 118, fit: BoxFit.fill,),
                    ),
                  ),
                  Obx(()=> controller.isProfileLoading.value ?
                  CardLoading(
                    margin: const EdgeInsets.only(top: 14, bottom: 6),
                    width: 160,
                    height: 24,
                    borderRadius: BorderRadius.circular(99),
                  ) : BaseText(
                      topMargin: 14,
                      value: controller.profileData?.value?.name?.toString()??"N/A",
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  BaseContainer(
                    topMargin: 14,
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
                          child: SvgPicture.asset(
                            BaseAssets.icEmail,
                            width: 18,
                            height: 18,
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const BaseText(
                                topMargin: 0,
                                leftMargin: 8,
                                value: "Email Address",
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                              ),
                              Obx(()=> controller.isProfileLoading.value ? const BaseShimmer(
                                topMargin: 6,
                                leftMargin: 8,
                                width: double.infinity,
                                height: 20,
                                borderRadius: 99,
                              ) : BaseText(
                                  topMargin: 3,
                                  leftMargin: 8,
                                  value: controller.profileData?.value?.email?.toString()??"N/A",
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  BaseContainer(
                    topMargin: 18,
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
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const BaseText(
                                topMargin: 0,
                                leftMargin: 8,
                                value: "Mobile Number",
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                              ),
                              Obx(()=> controller.isProfileLoading.value ? const BaseShimmer(
                                topMargin: 6,
                                leftMargin: 8,
                                width: double.infinity,
                                height: 20,
                                borderRadius: 99,
                              ) : BaseText(
                                  topMargin: 3,
                                  leftMargin: 8,
                                  // value: "+1 ${controller.profileData?.value?.mobile?.toString()??"N/A"}",
                                  value: "+1 ${MaskTextInputFormatter().updateMask(mask: '(###) ###-####', newValue: TextEditingValue(text: controller.profileData?.value?.mobile?.toString()??"")).text}",
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  BaseButton(
                    topMargin: 16,
                    btnHeight: 60,
                    title: "Edit Profile",
                    btnColor: BaseColors.secondaryColor,
                    onPressed: (){
                      Get.to(() => const EditProfileScreen());
                    },
                  ),
                  BaseButton(
                    topMargin: 16,
                    btnHeight: 60,
                    title: "Settings",
                    onPressed: (){
                      Get.to(() => SettingsScreen(isNotificationEnabled: (controller.profileData?.value?.isSendNotification?.toString()??"1") == "1"));
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
