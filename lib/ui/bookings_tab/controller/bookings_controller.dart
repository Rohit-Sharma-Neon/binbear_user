import 'package:binbear/backend/api_end_points.dart';
import 'package:binbear/backend/base_api_service.dart';
import 'package:binbear/ui/bookings_tab/model/bookings_response.dart';
import 'package:binbear/utils/base_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class BookingsController extends GetxController with GetSingleTickerProviderStateMixin{
  late TabController tabController;
  RxBool isLoading = false.obs;
  List<MyBookingsData>? list = <MyBookingsData>[];
  RefreshController upcomingRefreshController = RefreshController(initialRefresh: false);
  RefreshController pastRefreshController = RefreshController(initialRefresh: false);

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
    getMyBookingsApi();
    tabController.addListener(() {
      if (!(tabController.indexIsChanging)) {
        getMyBookingsApi();
      }
    });
  }

  getMyBookingsApi() async {
    if (!tabController.indexIsChanging) {
      isLoading.value = true;
      Map<String, String> data = {
        "booking_status": tabController.index.toString(),
      };
      try {
        await BaseApiService().post(apiEndPoint: ApiEndPoints().myBookings, data: data, showLoader: false).then((value){
          upcomingRefreshController.refreshCompleted();
          pastRefreshController.refreshCompleted();
          if (value?.statusCode ==  200) {
            MyBookingsResponse response = MyBookingsResponse.fromJson(value?.data);
            if (response.success??false) {
              list = response.data??[];
            }else{
              showSnackBar(subtitle: response.message??"");
            }
          }else{
            showSnackBar(subtitle: "Something went wrong, please try again");
          }
          isLoading.value = false;
        });
      } on Exception catch (e) {
        isLoading.value = false;
        upcomingRefreshController.refreshCompleted();
        pastRefreshController.refreshCompleted();
      }
    }
  }

}