import 'dart:async';

import 'package:address_search_field/address_search_field.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GeoController extends GetxController {
  final geoMethods = GeoMethods(
    googleApiKey: 'AIzaSyA7lPZZL00zERUiZBAcKy4AcEwaju79KWg',
    language: 'en',
    countryCode: 'uk',
  );

  final initalCameraPosition = const CameraPosition(
    target: LatLng(54.3071678, -2.464895),
    zoom: 6,
  );

  Rx<Address?> pointedAddress = Rx<Address?>(null);
  Rx<Marker?> marker = Rx<Marker?>(null);

  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  final TextEditingController addressTextController = TextEditingController();
  late final GoogleMapController googleMapController;

  @override
  void onInit() {
    ever(pointedAddress, (callback) {
      if (callback?.coords != null) {
        marker(Marker(
            markerId: const MarkerId("Address"),
            position: LatLng(
                callback!.coords!.latitude, callback.coords!.longitude)));
      }
    });
    super.onInit();
  }

  @override
  void onClose() {
    googleMapController.dispose();
    addressTextController.dispose();
    super.onClose();
  }
}
