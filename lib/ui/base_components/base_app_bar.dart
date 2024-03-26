import 'package:animate_do/animate_do.dart';
import 'package:binbear/ui/base_components/base_text.dart';
import 'package:binbear/ui/dashboard_module/dashboard_screen/controller/dashboard_controller.dart';
import 'package:binbear/ui/home_tab/controller/home_controller.dart';
import 'package:binbear/ui/manage_address/manage_address_screen.dart';
import 'package:binbear/ui/manual_address/manual_address_screen.dart';
import 'package:binbear/ui/manual_address/model/saved_address_response.dart';
import 'package:binbear/ui/notification/notification_screen.dart';
import 'package:binbear/ui/onboardings/splash/controller/base_controller.dart';
import 'package:binbear/utils/base_assets.dart';
import 'package:binbear/utils/base_functions.dart';
import 'package:binbear/utils/base_variables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Color? contentColor;
  final bool? showNotification,showDrawerIcon, showBackButton, showDefaultAddress;
  final Function()? onBackPressed;
  final Widget? bottomChild;
  final double? bottomWidgetHeight, titleSize, titleSpacing;
  final FontWeight? fontWeight;
  const BaseAppBar({super.key, this.title, this.onBackPressed, this.showNotification, this.showDrawerIcon, this.bottomChild, this.bottomWidgetHeight, this.contentColor, this.titleSize, this.fontWeight, this.titleSpacing, this.showBackButton, this.showDefaultAddress});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: FadeInDown(
          duration: const Duration(milliseconds: 400),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              BaseText(value: title??"", color: (showDrawerIcon??false) ? Colors.white : contentColor, fontSize: (showDrawerIcon??false) ? titleSize??18 : titleSize, fontWeight: (showDrawerIcon??false) ? FontWeight.w500 : fontWeight,),
              Visibility(
                visible: showDefaultAddress??false,
                child: GestureDetector(
                  onTap: (){
                    triggerHapticFeedback();
                    Get.to(() => const ManualAddressScreen(showSavedAddress: true))?.then((value) {
                      if (value != null) {
                        SavedAddressListData savedAddress = value;
                        Get.find<BaseController>().setDefaultAddress(addressID: savedAddress.id?.toString()??"").then((value) {
                          Get.find<HomeController>().userAddress?.value.fullAddress = savedAddress.fullAddress??"";
                          Get.find<HomeController>().update();
                        });
                      }
                    });
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GetBuilder<HomeController>(
                        builder: (HomeController controller) {
                          return BaseText(
                            value: controller.userAddress?.value.fullAddress?.toString().split(",").first??"",
                            fontSize: 13,
                            color: Colors.grey.shade300,
                            fontWeight: FontWeight.w400,
                            rightMargin: 5,
                          );
                        },
                      ),
                      SvgPicture.asset(BaseAssets.icArrowDown)
                    ],
                  ),
                ),
              ),
            ],
          ),
      ),
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