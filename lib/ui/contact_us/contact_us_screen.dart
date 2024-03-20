import 'package:binbear/ui/base_components/animated_column.dart';
import 'package:binbear/ui/base_components/base_app_bar.dart';
import 'package:binbear/ui/base_components/base_button.dart';
import 'package:binbear/ui/base_components/base_container.dart';
import 'package:binbear/ui/base_components/base_form_field_validator_icon.dart';
import 'package:binbear/ui/base_components/base_loader.dart';
import 'package:binbear/ui/base_components/base_scaffold_background.dart';
import 'package:binbear/ui/base_components/base_text.dart';
import 'package:binbear/ui/base_components/base_textfield.dart';
import 'package:binbear/ui/contact_us/controller/contact_us_controller.dart';
import 'package:binbear/utils/base_assets.dart';
import 'package:binbear/utils/base_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {

  ContactUsController controller = Get.put(ContactUsController());

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
                value: "Contact Us",
                fontSize: 27,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
              const BaseText(
                topMargin: 2,
                value: "Lorem ipsum is a dummy text\nfor using anywhere, anytime.",
                fontSize: 14,
                color: Color(0xffFBE6D3),
                fontWeight: FontWeight.w500,
              ),
              BaseContainer(
                topMargin: 30,
                rightPadding: 20,
                leftPadding: 20,
                topPadding: 20,
                bottomPadding: 20,
                bottomMargin: 0,
                child: GetBuilder<ContactUsController>(
                  builder: (ContactUsController controller) {
                    return Column(
                      children: [
                        BaseTextField(
                          controller: controller.nameController,
                          labelText: "Name",
                          hintText: "Enter Name",
                          textInputType: TextInputType.name,
                          suffixIcon: BaseFormFieldValidatorIcon(
                            textEditingController: controller.nameController,
                            failedOn: controller.nameController.text.length < 2,
                          ),
                          onChanged: (val){
                            controller.update();
                          },
                        ),
                        BaseTextField(
                          controller: controller.emailController,
                          labelText: "Email Address",
                          hintText: "Enter Email",
                          textInputType: TextInputType.emailAddress,
                          suffixIcon: BaseFormFieldValidatorIcon(
                            textEditingController: controller.emailController,
                            failedOn: !GetUtils.isEmail(controller.emailController.text),
                          ),
                          onChanged: (val){
                            controller.update();
                          },
                        ),
                        BaseTextField(
                          controller: controller.messageController,
                          labelText: "Message",
                          maxLine: 3,
                          hintText: "Write here...",
                          textInputType: TextInputType.multiline,
                          textInputAction: TextInputAction.newline,
                          suffixIcon: BaseFormFieldValidatorIcon(
                            textEditingController: controller.messageController,
                            failedOn: controller.messageController.text.length < 6,
                          ),
                          onChanged: (val){
                            controller.update();
                          },
                        ),
                        BaseButton(
                          topMargin: 22,
                          title: "Submit",
                          onPressed: (){
                            if (controller.nameController.text.trim().isEmpty) {
                              showSnackBar(subtitle: "Please Enter Your Name");
                            }else if (controller.nameController.text.trim().length < 2) {
                              showSnackBar(subtitle: "Please Enter Email");
                            }else if (controller.emailController.text.trim().isEmpty) {
                              showSnackBar(subtitle: "Please Enter Email");
                            }else if (!GetUtils.isEmail(controller.emailController.text.trim())) {
                              showSnackBar(subtitle: "Please Enter Valid Email");
                            }else if (controller.messageController.text.trim().isEmpty) {
                              showSnackBar(subtitle: "Please Enter Your Message");
                            }else if (controller.messageController.text.trim().length < 6) {
                              showSnackBar(subtitle: "Message too short!");
                            }else{
                              controller.callApi();
                            }
                          },
                        )
                      ],
                    );
                  },
                ),
              ),
              BaseContainer(
                topMargin: 20,
                rightPadding: 20,
                leftPadding: 20,
                topPadding: 20,
                bottomPadding: 20,
                borderRadius: 16,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(BaseAssets.icEmail),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BaseText(
                          value: "Email Us",
                          fontSize: 12,
                          leftMargin: 10,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                        BaseText(
                          value: "contact_info@binbear.com",
                          fontSize: 14,
                          leftMargin: 10,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
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
