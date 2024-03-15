import 'package:binbear/ui/about_app/controller/about_app_controller.dart';
import 'package:binbear/ui/base_components/base_app_bar.dart';
import 'package:binbear/ui/base_components/base_scaffold_background.dart';
import 'package:binbear/utils/base_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';

class AboutAppScreen extends StatefulWidget {
  final String type;
  const AboutAppScreen({super.key, required this.type});

  @override
  State<AboutAppScreen> createState() => _AboutAppScreenState();
}

class _AboutAppScreenState extends State<AboutAppScreen> {

  AboutAppController controller = Get.put(AboutAppController());

  @override
  void initState() {
    super.initState();
    controller.getResponse(type: widget.type);
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffoldBackground(
      child: Scaffold(
        appBar: BaseAppBar(
          title: widget.type,
          contentColor: Colors.white,
          titleSize: 20,
          fontWeight: FontWeight.w600,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(right: horizontalScreenPadding, left: horizontalScreenPadding, top: 5, bottom: 30),
            child: Obx(()=> Html(
              shrinkWrap: true,
              data: (controller.description).toString().replaceAll("\n", ""),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
