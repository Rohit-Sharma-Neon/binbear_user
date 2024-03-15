import 'dart:async';

import 'package:binbear/ui/onboardings/splash/controller/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapViewController extends GetxController{
  final Completer<GoogleMapController> mapController = Completer<GoogleMapController>();
  final BaseController baseController = Get.find<BaseController>();
  List<Marker> markers = <Marker>[];

  CameraPosition getInitialCameraPosition({required double lat, required double long}){
    return CameraPosition(
      target: LatLng(lat,long),
      zoom: 17,
    );
  }


   addMarker({required double latitude, required double longitude}) {
     markers.clear();
     markers.add(Marker(
       markerId: const MarkerId("default_marker"),
       position: LatLng(latitude, longitude),
       infoWindow: const InfoWindow(
         title: "Current Location",
         snippet: 'Current',
       ),
       icon: Get.find<BaseController>().defaultMarker,
     ));
  }


  locateToCurrentLocation() async {
    final GoogleMapController controller = await mapController.future;
    await baseController.getCurrentLocation().then((value) {
      if (value?.latitude != null && value?.longitude != null) {
        controller.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(
            bearing: 0,
            target: LatLng(value?.latitude??0, value?.longitude??0),
            zoom: 17,
          ),
        ));
        addMarker(latitude: value?.latitude??0, longitude: value?.longitude??0);
      }
    });
    update();
  }
}