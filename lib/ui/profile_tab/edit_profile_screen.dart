import 'package:animate_do/animate_do.dart';
import 'package:binbear/ui/base_components/animated_column.dart';
import 'package:binbear/ui/base_components/base_app_bar.dart';
import 'package:binbear/ui/base_components/base_button.dart';
import 'package:binbear/ui/base_components/base_container.dart';
import 'package:binbear/ui/base_components/base_radio_button.dart';
import 'package:binbear/ui/base_components/base_scaffold_background.dart';
import 'package:binbear/ui/base_components/base_text.dart';
import 'package:binbear/ui/base_components/base_textfield.dart';
import 'package:binbear/ui/profile_tab/controller/profile_controller.dart';
import 'package:binbear/utils/base_assets.dart';
import 'package:binbear/utils/base_colors.dart';
import 'package:binbear/utils/base_functions.dart';
import 'package:binbear/utils/base_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {

  ProfileController controller = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return BaseScaffoldBackground(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: const BaseAppBar(showDrawerIcon: false,),
        body: Column(
          children: [
            const BaseText(
              topMargin: 70,
              value: "Edit Profile",
              fontSize: 26,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
            const BaseText(
              topMargin: 5,
              value: "Lorem ipsum is a dummy text",
              fontSize: 14,
              color: Color(0xffFBE6D3),
              fontWeight: FontWeight.w400,
            ),
            Expanded(
              child: BaseContainer(
                topMargin: 15,
                bottomMargin: 18,
                rightMargin: horizontalScreenPadding,
                leftMargin: horizontalScreenPadding,
                child: SingleChildScrollView(
                  child: AnimatedColumn(
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Hero(
                            tag: "profile_image",
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(90),
                              child: Image.asset(
                                "assets/delete/dummy_profile.jpeg", width: 120, height: 120, fit: BoxFit.fill),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: ZoomIn(
                              duration: const Duration(milliseconds: 700),
                              child: Container(
                                padding: const EdgeInsets.all(9),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: BaseColors.primaryColor,
                                ),
                                child: const Icon(Icons.edit_sharp, color: Colors.white, size: 19),
                              ),
                            ),
                          )
                        ],
                      ),
                      BaseTextField(
                        topMargin: 30,
                        controller: TextEditingController(),
                        labelText: "Name",
                        hintText: "Enter Full Name",
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: SvgPicture.asset(BaseAssets.icPerson),
                        ),
                      ),
                      BaseTextField(
                        topMargin: 15,
                        controller: TextEditingController(),
                        labelText: "Email Address",
                        hintText: "Email Address",
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: SvgPicture.asset(BaseAssets.icEmail),
                        ),
                      ),
                      BaseTextField(
                        topMargin: 15,
                        controller: TextEditingController(),
                        labelText: "Mobile Number",
                        hintText: "Enter Mobile Number",
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: SvgPicture.asset(BaseAssets.icPhone),
                        ),
                      ),
                      const Align(
                        alignment: Alignment.topLeft,
                        child: BaseText(
                          topMargin: 15,
                          bottomMargin: 11,
                          value: "Gender",
                          color: Colors.black,
                          fontSize: 12,
                        ),
                      ),
                      Obx(()=>Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BaseRadioButton(
                              value: "Male",
                              selectedValue: controller.selectedGender.value,
                              onTap: () {
                                controller.selectedGender.value = "Male";
                              },
                            ),
                            BaseRadioButton(
                              value: "Female",
                              selectedValue: controller.selectedGender.value,
                              onTap: () {
                                controller.selectedGender.value = "Female";
                              },
                            ),
                            const SizedBox(width: 70),
                          ],
                        ),
                      ),
                      BaseButton(
                        topMargin: 30,
                        btnHeight: 60,
                        title: "Save",
                        onPressed: (){
                          triggerHapticFeedback();
                          Get.back();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
