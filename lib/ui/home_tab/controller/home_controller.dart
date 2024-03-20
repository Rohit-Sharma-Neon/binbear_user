import 'dart:ffi';

import 'package:binbear/backend/api_end_points.dart';
import 'package:binbear/backend/base_api_service.dart';
import 'package:binbear/ui/home_tab/model/home_response.dart';
import 'package:binbear/utils/base_functions.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeController extends GetxController{
  RxBool isHomeLoading = true.obs;
  RxBool isBannerImageLoading = true.obs;
  List<HomeBanners?>? banners = <HomeBanners?>[];
  RxList<HomeServices?>? services = <HomeServices?>[].obs;
  RxList<HomeBookings?>? bookings = <HomeBookings?>[].obs;
  RefreshController refreshController = RefreshController(initialRefresh: false);

  @override
  void onInit() {
    getHomeData();
    super.onInit();
  }

  getHomeData() async {
    isHomeLoading.value = true;
    isBannerImageLoading.value = true;
    try {
      await BaseApiService().get(apiEndPoint: ApiEndPoints().getHomeData, showLoader: false).then((value){
        refreshController.refreshCompleted();
        isHomeLoading.value = false;
        if (value?.statusCode ==  200) {
          HomeResponse response = HomeResponse.fromJson(value?.data);
          if (response.success??false) {
            banners = response.data?.banners??[];
            services?.value = response.data?.services??[];
            bookings?.value = response.data?.bookings??[];
          }else{
            showSnackBar(subtitle: response.message??"");
          }
        }else{
          showSnackBar(subtitle: "Something went wrong, please try again");
        }
      });
    } on Exception catch (e) {
      isHomeLoading.value = false;
      refreshController.refreshCompleted();
    }
  }
}