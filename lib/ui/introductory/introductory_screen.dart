import 'package:binbear/ui/base_components/base_app_bar.dart';
import 'package:binbear/ui/base_components/base_loader.dart';
import 'package:binbear/ui/base_components/base_scaffold_background.dart';
import 'package:binbear/ui/base_components/base_text.dart';
import 'package:binbear/ui/base_components/base_video_thumbnail2.dart';
import 'package:binbear/ui/base_components/listview_builder_animation.dart';
import 'package:binbear/ui/introductory/component/introductory_shimmer.dart';
import 'package:binbear/ui/introductory/controller/introductory_controller.dart';
import 'package:binbear/utils/base_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
                child: Obx(()=> (controller.list?.length??0) == 0 ? Row(
                  children: [
                    Visibility(
                        visible: controller.showResult.value,
                        child: const BaseNoData()),
                  ],
                ) : ListView.builder(
                  itemCount: controller.list?.length??0,
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(top: 10, right: 36, left: 36),
                  itemBuilder: (context, index){
                    return ListviewBuilderAnimation(
                      index: index,
                      child: GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: (){},
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 120,
                              margin: const EdgeInsets.only(bottom: 10),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: BaseVideoThumbnail2(videoLink: controller.list?[index]?.file??""),
                              ),
                            ),
                            SvgPicture.asset(BaseAssets.icVideoPlayButton)
                          ],
                        ),
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
