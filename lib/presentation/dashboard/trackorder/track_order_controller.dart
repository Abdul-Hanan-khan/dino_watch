import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import '../../../core/app_export.dart';

class TrackOrderController extends GetxController {
  TextEditingController search = TextEditingController();

  RxBool isLoading = false.obs;

  MapType currentMapType = MapType.terrain;

  Completer<GoogleMapController> googlecontroller = Completer();

  Set<Marker> markers = {};

  void onMapCreated(GoogleMapController controller) {
    googlecontroller.complete(controller);
  }

  @override
  void onInit() {
    if (kDebugMode) {
      print('object');
    }
    getLocation();
    super.onInit();
  }

  Location location = Location();
  bool? _serviceEnabled = false;
  LocationData? locationData;
  getLocation() async {
    isLoading.value = true;
    if (kDebugMode) {
      print(isLoading.value);
    }
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled!) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled!) {
        return;
      }
    }

    PermissionStatus? _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    locationData = await Location().getLocation();
    if (kDebugMode) {
      print(locationData);
    }
    isLoading.value = false;
    if (kDebugMode) {
      print(isLoading.value);
    }
    if (kDebugMode) {
      print("=======================================");
    }
    if (kDebugMode) {
      print("-=-=-=-=--=-=-=-=-");
      print(locationData!.latitude);
      print(locationData!.longitude);
    }
  }
}
