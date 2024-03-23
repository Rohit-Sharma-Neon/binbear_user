import 'package:binbear/backend/api_end_points.dart';
import 'package:binbear/backend/base_api_service.dart';
import 'package:binbear/backend/base_responses/base_success_response.dart';
import 'package:binbear/ui/booking_details/model/booking_details_response.dart';
import 'package:binbear/utils/base_functions.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class BookingDetailsController extends GetxController{
  RxBool isLoading = false.obs;
  BookingDetailsData? bookingDetailsData;
  RefreshController refreshController = RefreshController(initialRefresh: false);
  getBookingDetails({required String bookingId}) async {
    isLoading.value = true;
    bookingDetailsData = BookingDetailsData();
    Map<String, String> data = {
      "booking_id": bookingId,
    };
    try {
      await BaseApiService().post(apiEndPoint: ApiEndPoints().bookingDetail, showLoader: false, data: data).then((value){
        refreshController.refreshCompleted();
        if (value?.statusCode ==  200) {
          BookingDetailsResponse response = BookingDetailsResponse.fromJson(value?.data);
          if (response.success??false) {
            bookingDetailsData = response.data?.first;
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
      refreshController.refreshCompleted();
    }
  }

  giveBookingRating({required String bookingId, required String rating}) async {
    Map<String, String> data = {
      "booking_id": bookingId,
      "rating": rating,
    };
    try {
      await BaseApiService().post(apiEndPoint: ApiEndPoints().giveBookingRating, data: data).then((value){
        if (value?.statusCode ==  200) {
          BaseSuccessResponse response = BaseSuccessResponse.fromJson(value?.data);
          if (response.success??false) {
            Get.back(closeOverlays: true, canPop: false);
            showSnackBar(subtitle: response.message??"", isSuccess: true);
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