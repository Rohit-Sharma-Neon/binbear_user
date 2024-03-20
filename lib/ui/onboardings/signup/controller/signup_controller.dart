import 'package:binbear/backend/api_end_points.dart';
import 'package:binbear/backend/base_api_service.dart';
import 'package:binbear/ui/onboardings/otp_validation/otp_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../../../backend/base_success_response.dart';
import '../../../../utils/base_functions.dart';

class SignUpController extends GetxController{
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

  callSignUpApi(){
    Map<String, String> data = {
      "name":nameController.text.trim(),
      "email":emailController.text.trim(),
      "country_code":"+1",
      "mobile_no":mobileController.text.trim().replaceAll("(", "").replaceAll(")", "").replaceAll("-", "").replaceAll(" ", ""),
      "role":"1",
      "password":passwordController.text.trim(),
      "confirm_password":confirmPasswordController.text.trim(),
      "device_token":"xx",
    };
    BaseApiService().post(apiEndPoint: ApiEndPoints().signUpEndPoint, data: data).then((value){
      if (value?.statusCode ==  200) {
        BaseSuccessResponse response = BaseSuccessResponse.fromJson(value?.data);
        if (response.success??false) {
          Get.to(()=> const OtpScreen());
        }else{
          showSnackBar(subtitle: response.message??"");
        }
      }else{
        showSnackBar(subtitle: "Something went wrong, please try again");
      }
    });
  }
}