import 'package:binbear/backend/api_end_points.dart';
import 'package:binbear/backend/base_api_service.dart';
import 'package:binbear/backend/base_responses/base_success_response.dart';
import 'package:binbear/ui/introductory/model/introductory_response.dart';
import 'package:binbear/ui/onboardings/base_success_screen.dart';
import 'package:binbear/utils/base_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ContactUsController extends GetxController{

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  callApi(){
    Map<String, String> data = {
      "name":nameController.text.trim(),
      "email":emailController.text.trim(),
      "message":messageController.text.trim(),
    };
    BaseApiService().post(apiEndPoint: ApiEndPoints().contactUs, data: data).then((value){
        if (value?.statusCode ==  200) {
          BaseSuccessResponse response = BaseSuccessResponse.fromJson(value?.data);
          if (response.success??false) {
            triggerHapticFeedback();
            Get.off(() => BaseSuccessScreen(
                title: "Thank you!",
                description: "We've received your message. Someone from our team will contact you soon.",
                showBackButton: true,
                onBtnTap: (){
                  Get.back();
                },
            ),
            );
          }else{
            showSnackBar(subtitle: response.message??"");
          }
        }else{
          showSnackBar(subtitle: "Something went wrong, please try again");
        }
      });
  }
}