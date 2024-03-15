import 'package:binbear/backend/api_end_points.dart';
import 'package:binbear/backend/base_api_service.dart';
import 'package:binbear/ui/help_&_support/model/help_support_response.dart';
import 'package:binbear/utils/base_functions.dart';
import 'package:get/get.dart';

class HelpSupportController extends GetxController{
  RxList<HelpSupportData?>? list = <HelpSupportData?>[].obs;

  @override
  void onInit() {
    super.onInit();
    getResponse();
  }

  getResponse(){
    list?.clear();
    list?.refresh();
    BaseApiService().get(apiEndPoint: ApiEndPoints().helpSupport).then((value){
      if (value?.statusCode ==  200) {
        HelpSupportResponse response = HelpSupportResponse.fromJson(value?.data);
        if (response.success??false) {
          list?.value = response.data??[];
        }else{
          showSnackBar(subtitle: response.message??"");
        }
      }else{
        showSnackBar(subtitle: "Something went wrong, please try again");
      }
    });
  }
}