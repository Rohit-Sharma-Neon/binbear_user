import 'dart:developer';

import 'package:binbear/utils/base_functions.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:ui' as ui;

class BaseController extends GetxController{

  late BitmapDescriptor defaultMarker;

  @override
  void onInit() {
    super.onInit();
    loadMarker();
  }

  Future<Position?> getCurrentLocation() async {
    showBaseLoader();
    Position? position;
    bool isPermissionGranted = false;
    isPermissionGranted = await checkLocationPermission();
    if (isPermissionGranted) {
      try {
        position = await Geolocator.getCurrentPosition();
        log(
            '\nCurrent Latitude -> ${(position.latitude).toString()}'
            '\nCurrent Longitude -> ${(position.longitude).toString()}'
            '\nCurrent Accuracy -> ${(position.accuracy).toString()}'
        );
      } catch (e) {
        log(e.toString());
      }
    }
    dismissBaseLoader();
    return position;
  }

  Future<Uint8List?> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))?.buffer.asUint8List();
  }

  loadMarker() async {
    final Uint8List? markerIcon = await getBytesFromAsset('assets/images/ic_map_marker.png', 70);
    defaultMarker = BitmapDescriptor.fromBytes(markerIcon!);
  }

  Future<bool> checkLocationPermission() async {
    bool returnValue = true;
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        log('Location permissions are denied');
        returnValue = false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      returnValue = false;
      await Geolocator.openAppSettings();
      log('Location permissions are permanently denied, we cannot request permissions.');
    }
    return returnValue;
  }
}