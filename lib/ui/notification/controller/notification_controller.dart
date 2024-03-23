import 'package:binbear/backend/api_end_points.dart';
import 'package:binbear/backend/base_api_service.dart';
import 'package:binbear/backend/base_responses/base_success_response.dart';
import 'package:binbear/ui/notification/model/notification_response.dart';
import 'package:binbear/utils/base_functions.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class NotificationController extends GetxController{
  RxBool isNotificationLoading = false.obs;
  RefreshController refreshController = RefreshController(initialRefresh: false);
  RxList<NotificationListData>? list = <NotificationListData>[].obs;
  @override
  void onInit() {
    getNotificationsList();
    super.onInit();
  }

  getNotificationsList() async {
    list?.value = [];
    isNotificationLoading.value = true;
    try {
      await BaseApiService().get(apiEndPoint: ApiEndPoints().notificationList, showLoader: false).then((value){
        refreshController.refreshCompleted();
        if (value?.statusCode ==  200) {
          NotificationListResponse response = NotificationListResponse.fromJson(value?.data);
          if (response.success??false) {
            list?.value = response.data??[];
          }else{
            showSnackBar(subtitle: response.message??"");
          }
        }else{
          showSnackBar(subtitle: "Something went wrong, please try again");
        }
        isNotificationLoading.value = false;
      });
    } on Exception catch (e) {
      isNotificationLoading.value = false;
      refreshController.refreshCompleted();
    }
  }

  markAllAsReadApi() {
    Map<String, String> data = {
      "is_read": "1",
    };
    try {
      BaseApiService().post(apiEndPoint: ApiEndPoints().markAllAsRead, data: data).then((value){
        if (value?.statusCode ==  200) {
          BaseSuccessResponse response = BaseSuccessResponse.fromJson(value?.data);
          if (response.success??false) {
            list?.forEach((element) {
              element.isRead = 1;
            });
            list?.refresh();
          }else{
            showSnackBar(subtitle: response.message??"");
          }
        }else{
          showSnackBar(subtitle: "Something went wrong, please try again");
        }
      });
    } on Exception catch (e) {
      print(e.toString());
    }
  }
}