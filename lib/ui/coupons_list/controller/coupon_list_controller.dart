import 'package:binbear/backend/api_end_points.dart';
import 'package:binbear/backend/base_api_service.dart';
import 'package:binbear/ui/coupons_list/models/coupon_list_response.dart';
import 'package:binbear/utils/base_functions.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CouponListController extends GetxController{
  RxBool isCouponListLoading = false.obs;
  List<CouponListData>? couponList = <CouponListData>[];
  RefreshController refreshController = RefreshController(initialRefresh: false);

  @override
  void onInit() {
    getCouponList();
    super.onInit();
  }

  getCouponList() async {
    couponList = [];
    isCouponListLoading.value = true;
    try {
      await BaseApiService().get(apiEndPoint: ApiEndPoints().couponList, showLoader: false).then((value){
        refreshController.refreshCompleted();
        if (value?.statusCode ==  200) {
          CouponListResponse response = CouponListResponse.fromJson(value?.data);
          if (response.success??false) {
            couponList = response.data??[];
          }else{
            showSnackBar(subtitle: response.message??"");
          }
        }else{
          showSnackBar(subtitle: "Something went wrong, please try again");
        }
        isCouponListLoading.value = false;
      });
    } on Exception catch (e) {
      isCouponListLoading.value = false;
      refreshController.refreshCompleted();
    }
  }
}