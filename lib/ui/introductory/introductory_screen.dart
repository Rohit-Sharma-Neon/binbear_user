import 'package:binbear/ui/base_components/animated_column.dart';
import 'package:binbear/ui/base_components/base_app_bar.dart';
import 'package:binbear/ui/base_components/base_scaffold_background.dart';
import 'package:binbear/ui/base_components/base_text.dart';
import 'package:flutter/material.dart';

class IntroductoryScreen extends StatefulWidget {
  const IntroductoryScreen({super.key});

  @override
  State<IntroductoryScreen> createState() => _IntroductoryScreenState();
}

class _IntroductoryScreenState extends State<IntroductoryScreen> {
  bool isNotificationEnable = false;

  @override
  Widget build(BuildContext context) {
    return const BaseScaffoldBackground(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: BaseAppBar(),
        body: AnimatedColumn(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BaseText(
              topMargin: 75,
              value: "Introductory Videos",
              fontSize: 30,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
            BaseText(
              topMargin: 10,
              value: "Welcome to Binbear",
              fontSize: 14,
              color: Color(0xffFBE6D3),
              fontWeight: FontWeight.w500,
            ),
            Row(children: [])
          ],
        ),
      ),
    );
  }
}
