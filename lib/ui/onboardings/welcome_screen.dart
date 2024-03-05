import 'package:binbear/ui/base_components/animated_column.dart';
import 'package:binbear/ui/base_components/base_button.dart';
import 'package:binbear/ui/base_components/base_container.dart';
import 'package:binbear/ui/base_components/base_scaffold_background.dart';
import 'package:binbear/ui/base_components/base_text.dart';
import 'package:binbear/ui/onboardings/login/login_screen.dart';
import 'package:binbear/ui/onboardings/signup/signup_screen.dart';
import 'package:binbear/utils/base_assets.dart';
import 'package:binbear/utils/base_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffoldBackground(
      child: Scaffold(
        body: SingleChildScrollView(
          child: AnimatedColumn(
            children: [
              const SizedBox(height: 70),
              Hero(
                tag: "splash_tag",
                child: SvgPicture.asset(
                  BaseAssets.appLogoWithName,
                  width: 90,
                ),
              ),
              BaseContainer(
                topMargin: 26,
                bottomMargin: 40,
                child: AnimatedColumn(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const BaseText(
                        value: "Don’t Forget Trash\nDay Again",
                        textAlign: TextAlign.center,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        height: 1.3
                    ),
                    const BaseText(
                        topMargin: 12,
                        value: "Let Us Take Your\nTrash Cans Out\nFor You!",
                        textAlign: TextAlign.center,
                        fontSize: 26,
                        fontWeight: FontWeight.w700,
                        height: 1.3
                    ),
                    BaseButton(
                      topMargin: 24,
                      title: "Sign Up For Services!",
                      onPressed: (){
                        Get.to(() => const SignUpScreen());
                      },
                      bottomMargin: 18,
                    ),
                    BaseText(
                      value: "Already have and account?",
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      onTap: (){
                        Get.to(() => const LoginScreen());
                      },
                    ),
                    BaseText(
                      value: "Log in",
                      fontSize: 14,
                      color: BaseColors.secondaryColor,
                      fontWeight: FontWeight.w500,
                      onTap: (){
                        Get.to(const LoginScreen());
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
