import 'package:binbear/backend/api_end_points.dart';
import 'package:binbear/backend/base_api_service.dart';
import 'package:binbear/backend/base_success_response.dart';
import 'package:binbear/utils/base_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordController extends GetxController{
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool obscureOldPassword = false;
  bool obscureNewPassword = false;
  bool obscureConfirmPassword = false;

  changePassword(){
    Map<String, String> data = {
      "current_password": oldPasswordController.text.trim(),
      "new_password": newPasswordController.text.trim(),
      "confirm_password": confirmPasswordController.text.trim(),
    };
    BaseApiService().post(apiEndPoint: ApiEndPoints().changePassword, data: data).then((value){
      if (value?.statusCode ==  200) {
        BaseSuccessResponse response = BaseSuccessResponse.fromJson(value?.data);
        if (response.success??false) {
          triggerHapticFeedback();
          Get.back();
          showSnackBar(subtitle: response.message??"", isSuccess: true);
        }else{
          showSnackBar(subtitle: response.message??"");
        }
      }else{
        showSnackBar(subtitle: "Something went wrong, please try again");
      }
    });
  }
}