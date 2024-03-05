import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OtpController extends GetxController{
  TextEditingController otpController = TextEditingController();
  RxBool isResendEnable = false.obs;
}