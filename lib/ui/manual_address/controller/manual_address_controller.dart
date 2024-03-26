import 'package:binbear/utils/base_functions.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';

import '../../map_view/map_view_screen.dart';
import '../../onboardings/splash/controller/base_controller.dart';

class ManualAddressController extends GetxController{
  TextEditingController searchController = TextEditingController();

  locateToCurrentLocation({bool? showSavedAddress}) async {
    await Get.find<BaseController>().getCurrentLocation().then((value) async {
      if (value?.latitude != null && value?.longitude != null) {
        var placeMarks = await placemarkFromCoordinates(value?.latitude??0, value?.longitude??0);
        Placemark place = placeMarks[0];
        String finalAddress = '${place.name}, ${place.subLocality}, ${place.locality}, ${place.administrativeArea}, ${place.country}, ${place.postalCode}';
        Get.to(()=> MapViewScreen(
          lat: value?.latitude??0,
          long: value?.longitude??0,
          fullAddress: finalAddress,
          mainAddress: place.street,
          subAddress: "${place.subLocality}, ${place.locality}, ${place.administrativeArea}, ${place.country}, ${place.postalCode}",
          showSavedAddress: showSavedAddress??false,
        ));
      }
    });
  }
}