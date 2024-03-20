import 'package:binbear/backend/api_end_points.dart';
import 'package:binbear/backend/base_api_service.dart';
import 'package:binbear/ui/introductory/model/introductory_response.dart';
import 'package:binbear/utils/base_functions.dart';
import 'package:get/get.dart';

class IntroductoryController extends GetxController{
  RxList<IntroductoryData?>? list = <IntroductoryData?>[].obs;
  RxBool showResult = false.obs;

  @override
  void onInit() {
    super.onInit();
    getResponse();
  }

  getResponse(){
    list?.clear();
    BaseApiService().get(apiEndPoint: ApiEndPoints().introductory).then((value){
        if (value?.statusCode ==  200) {
          IntroductoryResponse response = IntroductoryResponse.fromJson(value?.data);
          if (response.success??false) {
            list?.value = response.data??[];
          }else{
            showSnackBar(subtitle: response.message??"");
          }
        }else{
          showSnackBar(subtitle: "Something went wrong, please try again");
        }
        showResult.value = true;
      });
  }
}