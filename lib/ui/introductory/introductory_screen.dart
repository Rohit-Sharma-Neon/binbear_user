import 'package:binbear/ui/base_components/base_app_bar.dart';
import 'package:binbear/ui/base_components/base_loader.dart';
import 'package:binbear/ui/base_components/base_scaffold_background.dart';
import 'package:binbear/ui/base_components/base_text.dart';
import 'package:binbear/ui/base_components/listview_builder_animation.dart';
import 'package:binbear/ui/introductory/component/introductory_shimmer.dart';
import 'package:binbear/ui/introductory/controller/introductory_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

class IntroductoryScreen extends StatefulWidget {
  const IntroductoryScreen({super.key});

  @override
  State<IntroductoryScreen> createState() => _IntroductoryScreenState();
}

class _IntroductoryScreenState extends State<IntroductoryScreen> {

  IntroductoryController controller = Get.put(IntroductoryController());

  @override
  Widget build(BuildContext context) {
    return BaseScaffoldBackground(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: const BaseAppBar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const BaseText(
              topMargin: 75,
              value: "Introductory Videos",
              fontSize: 27,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
            const BaseText(
              topMargin: 2,
              value: "Welcome to Binbear",
              fontSize: 14,
              color: Color(0xffFBE6D3),
              fontWeight: FontWeight.w500,
            ),
            Expanded(
              child: AnimationLimiter(
                child: Obx(()=> (controller.isLoading.value) ? const IntroductoryShimmer() :
                (controller.list?.length??0) == 0 ? const BaseNoData() : ListView.builder(
                  itemCount: controller.list?.length??0,
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(top: 10, right: 36, left: 36),
                  itemBuilder: (context, index){
                    return ListviewBuilderAnimation(
                      index: index,
                      child: Container(
                        width: double.infinity,
                        height: 100,
                        margin: const EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)
                        )
                        ),
                      );
                      },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
