import 'package:binbear/backend/api_end_points.dart';
import 'package:binbear/backend/base_api_service.dart';
import 'package:binbear/ui/introductory/model/introductory_response.dart';
import 'package:binbear/utils/base_functions.dart';
import 'package:get/get.dart';

class IntroductoryController extends GetxController{
  RxList<IntroductoryData?>? list = <IntroductoryData?>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getResponse();
  }

  getResponse(){
    isLoading.value = true;
    list?.clear();
    list?.refresh();
    try {
      BaseApiService().get(apiEndPoint: ApiEndPoints().introductory, showLoader: false).then((value){
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
        isLoading.value = false;
      });
    } finally {
      isLoading.value = false;
    }
  }
}