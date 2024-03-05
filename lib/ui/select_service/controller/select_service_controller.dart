import 'package:get/get.dart';

class SelectServiceController extends GetxController{
  RxInt selectedServiceIndex = 0.obs;
  RxList<String> serviceImages = <String>[
    "assets/delete/can_2_curb_service.svg",
    "assets/delete/bulk_trash_pickup.svg",
    "assets/delete/trash_can_cleaning.svg",
  ].obs;

  List<String> serviceTitles = [
    "Can 2 Curb Service",
    "Bulk Trash Pickup",
    "Trash Can Cleaning",
  ];
}