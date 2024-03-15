import 'package:binbear/ui/base_components/animated_column.dart';
import 'package:binbear/ui/base_components/base_app_bar.dart';
import 'package:binbear/ui/base_components/base_button.dart';
import 'package:binbear/ui/base_components/base_container.dart';
import 'package:binbear/ui/base_components/base_scaffold_background.dart';
import 'package:binbear/ui/chat_tab/chat_tab.dart';
import 'package:binbear/ui/help_&_support/controller/help_support_controller.dart';
import 'package:binbear/utils/base_colors.dart';
import 'package:binbear/utils/base_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

import '../base_components/base_text.dart';
import '../base_components/listview_builder_animation.dart';

class HelpSupportScreen extends StatefulWidget {
  const HelpSupportScreen({super.key});

  @override
  State<HelpSupportScreen> createState() => _HelpSupportScreenState();
}

class _HelpSupportScreenState extends State<HelpSupportScreen> {

  HelpSupportController controller = Get.put(HelpSupportController());

  @override
  Widget build(BuildContext context) {
    return BaseScaffoldBackground(
        child: Scaffold(
          appBar: const BaseAppBar(
            title: "Help & Support",
            titleSize: 20,
            titleSpacing: 0,
            contentColor: Colors.white,
          ),
          body: SingleChildScrollView(
            child: AnimatedColumn(
              children: [
                BaseContainer(
                  rightPadding: 25,
                  leftPadding: 25,
                  borderRadius: 13,
                  bottomPadding: 10,
                  bottomMargin: 0,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const BaseText(
                        value: "FAQs",
                        fontSize: 23,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                      AnimationLimiter(
                        child: Obx(()=> (controller.list?.length??0) == 0 ?
                        const BaseText(
                          topMargin: 6,
                          bottomMargin: 6,
                          value: "No Data Found!",
                          fontSize: 14,
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                        ) : ListView.builder(
                            shrinkWrap: true,
                            itemCount: controller.list?.length??0,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index){
                              return ListviewBuilderAnimation(
                                index: index,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ExpansionTile(
                                      shape: const Border(),
                                      onExpansionChanged: (val){triggerHapticFeedback();},
                                      tilePadding: EdgeInsets.zero,
                                      childrenPadding: EdgeInsets.zero,
                                      collapsedIconColor: BaseColors.secondaryColor,
                                      iconColor: BaseColors.secondaryColor,
                                      expandedAlignment: Alignment.topLeft,
                                      title: BaseText(
                                        value: controller.list?[index]?.question??"",
                                        fontSize: 17,
                                        fontWeight: FontWeight.w700,
                                      ),
                                      children: [
                                        BaseText(
                                          textAlign: TextAlign.start,
                                          value: controller.list?[index]?.answer??"",
                                          fontWeight: FontWeight.w600,
                                          color: Colors.grey,
                                          bottomMargin: 19,
                                        ),
                                      ],
                                    ),
                                    Visibility(
                                      visible: index != 2,
                                      child: Container(
                                        width: double.infinity,
                                        height: 1.3,
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Colors.grey.withOpacity(0.01),
                                              Colors.grey.shade600.withOpacity(1.0),
                                              Colors.grey.withOpacity(0.01),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                BaseContainer(
                  topMargin: 18,
                  rightPadding: 25,
                  leftPadding: 25,
                  borderRadius: 13,
                  bottomPadding: 3,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const BaseText(
                        value: "Still have a\nquery?",
                        fontSize: 28,
                        textAlign: TextAlign.center,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                      BaseButton(
                        topMargin: 26,
                        bottomMargin: 20,
                        title: "Chat With Us",
                        onPressed: (){
                          Get.to(() => const ChatTab());
                        },
                      )
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
