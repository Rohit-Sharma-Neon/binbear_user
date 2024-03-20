import 'package:binbear/ui/base_components/animated_column.dart';
import 'package:binbear/ui/base_components/base_app_bar.dart';
import 'package:binbear/ui/base_components/base_container.dart';
import 'package:binbear/ui/base_components/base_scaffold_background.dart';
import 'package:binbear/ui/base_components/base_text.dart';
import 'package:binbear/ui/change_password/change_password_screen.dart';
import 'package:binbear/ui/onboardings/welcome_screen.dart';
import 'package:binbear/ui/settings/controller/settings_controller.dart';
import 'package:binbear/utils/base_assets.dart';
import 'package:binbear/utils/base_colors.dart';
import 'package:binbear/utils/base_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatefulWidget {
  final bool isNotificationEnabled;
  const SettingsScreen({super.key, required this.isNotificationEnabled});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  SettingsController controller = Get.put(SettingsController());

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      controller.isNotificationEnable.value = widget.isNotificationEnabled;
    });
  }

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
                value: "Settings",
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
                topMargin: 26,
                borderRadius: 14,
                leftPadding: 22,
                rightPadding: 8,
                bottomMargin: 22,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const BaseText(
                          value: "Notification",
                          fontSize: 13,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                        SizedBox(
                          height: 14,
                          child: Transform.scale(
                            scale: 0.8,
                            child: Obx(()=>Switch(
                                value: controller.isNotificationEnable.value,
                                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                inactiveThumbColor: Colors.black,
                                inactiveTrackColor: Colors.grey.shade400,
                                activeColor: BaseColors.primaryColor,
                                trackOutlineWidth: MaterialStateProperty.resolveWith<double>((Set<MaterialState> states) {
                                  return 0.0;
                                }),
                                trackOutlineColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                                  return Colors.transparent;
                                }),
                                thumbColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                                    return Colors.black;
                                  },
                                ),
                                onChanged: (val){
                                  triggerHapticFeedback();
                                  controller.isNotificationEnable.value = val;
                                  controller.callApi(newValue: val);
                                },
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const BaseText(
                      topMargin: 7,
                      value: "Turn on your notification alert",
                      fontSize: 15,
                      color: Color(0xff30302E),
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: (){
                  triggerHapticFeedback();
                  Get.to(() => const ChangePasswordScreen());
                },
                child: BaseContainer(
                  borderRadius: 14,
                  leftPadding: 22,
                  rightPadding: 22,
                  bottomMargin: 22,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const BaseText(
                        value: "Change Password",
                        fontSize: 15,
                        color: Color(0xff30302E),
                        fontWeight: FontWeight.w600,
                      ),
                      SvgPicture.asset(BaseAssets.icArrowRight)
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  triggerHapticFeedback();
                  Get.offAll(() => const WelcomeScreen());
                },
                child: BaseContainer(
                  borderRadius: 14,
                  leftPadding: 22,
                  rightPadding: 22,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const BaseText(
                        value: "Log Out",
                        fontSize: 15,
                        color: Color(0xff30302E),
                        fontWeight: FontWeight.w600,
                      ),
                      SvgPicture.asset(BaseAssets.icArrowRight)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
