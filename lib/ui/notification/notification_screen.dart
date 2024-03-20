import 'package:binbear/ui/base_components/base_app_bar.dart';
import 'package:binbear/ui/base_components/base_container.dart';
import 'package:binbear/ui/base_components/base_scaffold_background.dart';
import 'package:binbear/ui/notification/components/notification_shimmer.dart';
import 'package:binbear/utils/base_colors.dart';
import 'package:binbear/utils/base_functions.dart';
import 'package:binbear/utils/base_variables.dart';
import 'package:flutter/material.dart';

import '../base_components/base_text.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return BaseScaffoldBackground(
      child: Scaffold(
        appBar: const BaseAppBar(title: "Notifications", contentColor: Colors.white, titleSize: 20, fontWeight: FontWeight.w500,),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                BaseText(
                  value: "Mark all as read",
                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  onTap: (){
                    triggerHapticFeedback();
                  },
                ),
                Container(
                  width: 14,
                  height: 14,
                  margin: const EdgeInsets.only(left: 6, right: horizontalScreenPadding),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: const Icon(
                    Icons.check,
                    size: 10,
                    color: BaseColors.primaryColor,
                  ),
                ),
              ],
            ),
            Expanded(
              child: BaseContainer(
                topMargin: 10,
                bottomMargin: horizontalScreenPadding,
                rightMargin: horizontalScreenPadding,
                leftMargin: horizontalScreenPadding,
                rightPadding: 0,
                leftPadding: 0,
                child: isLoading ? const NotificationShimmer() : ListView.builder(
                  itemCount: 20,
                  padding: const EdgeInsets.only(right: 15, left: 17),
                  shrinkWrap: true,
                    itemBuilder: (context, index){
                      return Stack(
                        clipBehavior: Clip.none,
                        fit: StackFit.loose,
                        children: [
                          Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(90),
                                      child: Image.asset("assets/delete/dummy_profile.jpeg", width: 35, height: 35),
                                  ),
                                  const SizedBox(width: 8),
                                  const Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        BaseText(
                                          value: "Services!!!",
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                          fontSize: 15,
                                          height: 0,
                                          color: Color(0xff30302E),
                                          fontWeight: FontWeight.w700,
                                        ),
                                        BaseText(
                                          value: "Lorem Ipsum is simply dummy",
                                          fontSize: 13,
                                          height: 0,
                                          maxLines: 8,
                                          overflow: TextOverflow.ellipsis,
                                          color: Color(0xff8E8E8E),
                                          fontWeight: FontWeight.w400,
                                        ),
                                        BaseText(
                                          topMargin: 12,
                                          value: "Today, 3:30 pm",
                                          fontSize: 9,
                                          color: Color(0xff5B5B77),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              divider(),
                            ],
                          ),
                          Positioned(
                            left: -3,
                            top: -8,
                            child: Container(
                              width: 6,
                              height: 6,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.green.shade900
                              ),
                            ),
                          )
                        ],
                      );
                },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget divider(){
    return Container(
      width: double.infinity,
      height: 1.3,
      margin: const EdgeInsets.only(top: 12, bottom: 12),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.grey.withOpacity(0.01),
            Colors.grey.shade500.withOpacity(1.0),
            Colors.grey.withOpacity(0.01),
          ],
        ),
      ),
    );
  }
}
