import 'package:binbear/utils/base_colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

triggerHapticFeedback(){
  HapticFeedback.vibrate();
}

void showBaseLoader() {
  showDialog(
    context: Get.context!,
    barrierDismissible: false,
    builder: (context) => PopScope(
      canPop: false,
      child: GestureDetector(
        onLongPress: (){
          if (kDebugMode) {
            dismissBaseLoader();
          }
        },
        child: Container(
          color: Colors.black26,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: const Center(
            child: CircularProgressIndicator.adaptive(
              valueColor: AlwaysStoppedAnimation<Color>(BaseColors.primaryColor),
            ),
          ),
        ),
      ),
    ),
  );
}

void dismissBaseLoader(){
  Get.back(canPop: false, closeOverlays: true);
}
