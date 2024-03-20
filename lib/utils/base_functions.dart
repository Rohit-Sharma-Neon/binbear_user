import 'package:binbear/ui/base_components/base_text.dart';
import 'package:binbear/utils/base_colors.dart';
import 'package:binbear/utils/base_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

triggerHapticFeedback(){
  HapticFeedback.vibrate();
}

MaskTextInputFormatter usPhoneMask = MaskTextInputFormatter(
    mask: '(###) ###-####',
    filter: { "#": RegExp(r'[0-9]') },
    type: MaskAutoCompletionType.lazy
);

void showBaseLoader({bool? showLoader}) {
  if (showLoader??true) {
    Get.context!.loaderOverlay.show();
    Future.delayed( const Duration(seconds: apiTimeOut), () {
      Get.context!.loaderOverlay.hide();
    });
  }
}

void dismissBaseLoader({bool? showLoader}){
  if (showLoader??true) {
    Get.context!.loaderOverlay.hide();
  }
}

showSnackBar({bool? isSuccess, String? title, String? subtitle, BuildContext? context}){
  if (Get.isSnackbarOpen) {
    Get.closeAllSnackbars();
  }else{
    Get.snackbar(
      "", "",
      padding: const EdgeInsets.only(left: 24, right: 18, top: 24, bottom: 24),
      titleText: Row(
        children: [
          Expanded(
            child: BaseText(
              value: (title??"").isEmpty ? (isSuccess??false) ? "Success!" : "Error!" : title??"",
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          GestureDetector(
            onTap: (){
              triggerHapticFeedback();
              Get.closeCurrentSnackbar();
            }, child: const Icon(
            Icons.close,
            color: Colors.white,
            size: 20,
          ),
          ),
        ],
      ),
      messageText: BaseText(
        value: subtitle??"",
        fontSize: 13,
        color: Colors.white,
        fontWeight: FontWeight.w400,
      ),
      snackPosition: SnackPosition.TOP,
      margin: const EdgeInsets.only(right: horizontalScreenPadding, left: horizontalScreenPadding, top: 18),
      backgroundColor: (isSuccess??false) ? Colors.green.shade900.withOpacity(0.8) : BaseColors.primaryColor.withOpacity(0.8),
      colorText: Colors.white,
    );
  }

  // final snackBar = SnackBar(
  //   elevation: 0,
  //   margin: EdgeInsets.only(right: horizontalScreenPadding, left: ),
  //   behavior: SnackBarBehavior.floating,
  //   backgroundColor: Colors.transparent,
  //   content: AwesomeSnackbarContent(
  //     title: (title??"").isEmpty ? (isSuccess??false) ? "Success!" : "Error!" : title??"",
  //     message: subtitle??"",
  //     contentType: (isSuccess??false) ? ContentType.success : ContentType.failure,
  //   ),
  // );
  //
  // ScaffoldMessenger.of(context??Get.context!)
  //   ..hideCurrentSnackBar()
  //   ..showSnackBar(snackBar);
}
