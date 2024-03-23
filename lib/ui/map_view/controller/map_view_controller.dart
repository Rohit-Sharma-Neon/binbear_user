import 'dart:async';
import 'package:binbear/backend/base_responses/autocomplete_api_response.dart';
import 'package:binbear/utils/base_debouncer.dart';
import 'package:binbear/utils/base_strings.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:dio/dio.dart' as as_dio;
import 'package:uuid/uuid.dart';
import '../../onboardings/splash/controller/base_controller.dart';

class MapViewController extends GetxController{
  final Completer<GoogleMapController> mapController = Completer<GoogleMapController>();
  final BaseController baseController = Get.find<BaseController>();
  List<Marker> markers = <Marker>[];
  RxString selectedLocation = "".obs;

  BaseDebouncer debouncer = BaseDebouncer();
  String sessionToken = "";
  var uuid = const Uuid();
  as_dio.Dio dio = as_dio.Dio();
  RxList<dynamic> searchResultList = <dynamic>[].obs;
  TextEditingController searchController = TextEditingController();
  onChanged() {
    if (sessionToken.isEmpty) {
      sessionToken = uuid.v4();
    }
    getSuggestion(searchController.text);
  }

  getSuggestion(String input) async {
    dio = Dio();
    String baseURL = 'https://maps.googleapis.com/maps/api/place/autocomplete/json';
    String request = '$baseURL?input=$input&key=$googleApiKey&sessiontoken=$sessionToken';
    print("Input: $input");
    as_dio.Response response = await dio.get(request);
    if (response.statusCode == 200) {
        searchResultList.value = response.data['predictions'];
    } else {
      throw Exception('Failed to load predictions');
    }
  }

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