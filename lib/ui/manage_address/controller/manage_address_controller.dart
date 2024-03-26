import 'package:binbear/backend/api_end_points.dart';
import 'package:binbear/backend/base_api_service.dart';
import 'package:binbear/backend/base_responses/base_success_response.dart';
import 'package:binbear/ui/dashboard_module/dashboard_screen/dashboard_screen.dart';
import 'package:binbear/ui/onboardings/splash/controller/base_controller.dart';
import 'package:binbear/utils/base_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ManageAddressController extends GetxController{
  RxString selectedAddressType = "Home".obs;
  TextEditingController houseNoController = TextEditingController();
  TextEditingController apartmentController = TextEditingController();
  TextEditingController landmarkController = TextEditingController();
  List<String> addressTypeList = [
    "Home", "Work", "Friends & Family", "Other",
  ];

  saveAddress({required double lat, required double lng, required String fullAddress, bool? showSavedAddress}){
    Map<String, String> data = {
      "flat_no":houseNoController.text.trim(),
      "apartment":apartmentController.text.trim(),
      "description":landmarkController.text.trim(),
      "home_type":getAddressTypeNumber(getAddressTypeName: selectedAddressType.value),
      "full_address":fullAddress,
      "lat":lat.toString(),
      "lng":lng.toString(),
    };
    BaseApiService().post(apiEndPoint: ApiEndPoints().addAddress, data: data).then((value){
      if (value?.statusCode ==  200) {
        BaseSuccessResponse response = BaseSuccessResponse.fromJson(value?.data);
        if (response.success??false) {
          if (showSavedAddress??false) {
            Get.back();
            Get.back();
            Get.find<BaseController>().getSavedAddress();
          }else{
            Get.offAll(() => const DashBoardScreen());
          }
        }else{
          showSnackBar(subtitle: response.message??"");
        }
      }else{
        showSnackBar(subtitle: "Something went wrong, please try again");
      }
    });
  }

  updateAddress({required double lat, required double lng, required String fullAddress, required String savedAddressId}){
    Map<String, String> data = {
      "flat_no":houseNoController.text.trim(),
      "apartment":apartmentController.text.trim(),
      "description":landmarkController.text.trim(),
      "home_type":getAddressTypeNumber(getAddressTypeName: selectedAddressType.value),
      "full_address":fullAddress,
      "lat":lat.toString(),
      "lng":lng.toString(),
      "address_id":savedAddressId,
    };
    BaseApiService().post(apiEndPoint: ApiEndPoints().addAddress, data: data).then((value){
      if (value?.statusCode ==  200) {
        BaseSuccessResponse response = BaseSuccessResponse.fromJson(value?.data);
        if (response.success??false) {
          Get.offAll(() => const DashBoardScreen());
        }else{
          showSnackBar(subtitle: response.message??"");
        }
      }else{
        showSnackBar(subtitle: "Something went wrong, please try again");
      }
    });
  }
}