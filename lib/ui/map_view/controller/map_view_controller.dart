import 'dart:async';

import 'package:binbear/ui/onboardings/splash/controller/base_controller.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapViewController extends GetxController{
  final Completer<GoogleMapController> mapController = Completer<GoogleMapController>();
  final BaseController baseController = Get.find<BaseController>();

  CameraPosition kGooglePlex = const CameraPosition(
    target: LatLng(26.8506252, 75.7616548),
    zoom: 14.4746,
  );

  void addMarker({required Position position}) {
    final Marker marker = Marker(
      markerId: const MarkerId("current_location_marker"),
      position: LatLng(position.latitude, position.longitude),
      infoWindow: const InfoWindow(
        title: "Current Location",
        snippet: 'Current',
      ),
    );

    // setState(() {
    //   markers[markerId] = marker;
    // });
  }

  locateToCurrentLocation() async {
    final GoogleMapController controller = await mapController.future;
    baseController.getCurrentLocation().then((value) {
      if (value?.latitude != null && value?.longitude != null) {
        controller.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(
            bearing: 0,
            target: LatLng(value?.latitude??0, value?.longitude??0),
            zoom: 17,
          ),
        ));
      }
    });
  }

}