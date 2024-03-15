import 'package:animate_do/animate_do.dart';
import 'package:binbear/ui/base_components/base_text.dart';
import 'package:binbear/ui/dashboard_module/dashboard_screen/controller/dashboard_controller.dart';
import 'package:binbear/ui/notification/notification_screen.dart';
import 'package:binbear/utils/base_assets.dart';
import 'package:binbear/utils/base_functions.dart';
import 'package:binbear/utils/base_variables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Color? contentColor;
  final bool? showNotification,showDrawerIcon, showBackButton;
  final Function()? onBackPressed;
  final Widget? bottomChild;
  final double? bottomWidgetHeight, titleSize, titleSpacing;
  final FontWeight? fontWeight;
  const BaseAppBar({super.key, this.title, this.onBackPressed, this.showNotification, this.showDrawerIcon, this.bottomChild, this.bottomWidgetHeight, this.contentColor, this.titleSize, this.fontWeight, this.titleSpacing, this.showBackButton});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: FadeInDown(
          duration: const Duration(milliseconds: 400),
          child: BaseText(value: title??"", color: (showDrawerIcon??false) ? Colors.white : contentColor, fontSize: (showDrawerIcon??false) ? 18 : titleSize, fontWeight: (showDrawerIcon??false) ? FontWeight.w500 : fontWeight,)),
      backgroundColor: Colors.transparent,
      titleSpacing: (showDrawerIcon??false) ? 0 : titleSpacing,
      elevation: 0.0,
      scrolledUnderElevation: 0,
      centerTitle: false,
      automaticallyImplyLeading: false,
      bottom: PreferredSize(preferredSize: Size.fromHeight(bottomWidgetHeight??0),
      child: bottomChild ?? const SizedBox.shrink()),
      leading: FadeInDown(
        duration: const Duration(milliseconds: 400),
        child: (showDrawerIcon??false)
        ///   Drawer Icon
            ? GestureDetector(onTap: (){
              triggerHapticFeedback();
          Get.find<DashboardController>().scaffoldKey.currentState?.openDrawer();
        }, child: Padding(
                padding: const EdgeInsets.all(12),
                child: SvgPicture.asset(BaseAssets.icDrawer),
            ))
        ///   Back Icon
            : Visibility(
          visible: showBackButton??true,
              child: GestureDetector(onTap: onBackPressed ?? (){
                triggerHapticFeedback();
                Get.back();
              },child: Icon(Icons.arrow_back_sharp,
                color: contentColor??Colors.white,size: 30)),
            ),
      ),
      actions: [
        Visibility(
          visible: showNotification??false,
          child: FadeInDown(
            duration: const Duration(milliseconds: 400),
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: (){
                triggerHapticFeedback();
                Get.to(() => const NotificationScreen());
              },
              child: Padding(
                padding: const EdgeInsets.only(right: horizontalScreenPadding, top: 5, bottom: 5, left: horizontalScreenPadding),
                child: SvgPicture.asset(
                  BaseAssets.icNotification,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight+(bottomWidgetHeight??0));
}