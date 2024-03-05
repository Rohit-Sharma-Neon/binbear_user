import 'package:binbear/utils/base_functions.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController{
  RxInt selectedNavIndex = 0.obs;
  DateTime currentBackPressTime = DateTime.now();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  PageController pageController = PageController(initialPage: 0, keepPage: true);

  Future<bool> onWillPop() {
    if (scaffoldKey.currentState?.isDrawerOpen??false) {
      scaffoldKey.currentState?.closeDrawer();
      return Future.value(false);
    }else{
      if (pageController.page == 0) {
        DateTime now = DateTime.now();
        if (now.difference(currentBackPressTime) > const Duration(seconds: 1)) {
          currentBackPressTime = now;
          Fluttertoast.showToast(msg: "Press back again to exit app");
          return Future.value(false);
        }
        return Future.value(true);
      }else{
        selectedNavIndex.value = 0;
        pageController.animateToPage(0, duration: const Duration(milliseconds: 300), curve: Curves.ease);
        return Future.value(false);
      }
    }
  }

  changeTab(index){
    triggerHapticFeedback();
    selectedNavIndex.value = index;
    pageController.animateToPage(index, duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }
}