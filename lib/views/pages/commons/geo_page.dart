import 'package:address_search_field/address_search_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../controllers/common/geo_controller.dart';

class GeoPage extends GetView<GeoController> {
  const GeoPage({super.key});
  static String path = '/geo';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Address"),
      ),
      body: Stack(
        children: [
          Obx(() => GoogleMap(
              markers: controller.marker.value != null
                  ? {controller.marker.value!}
                  : {},
              initialCameraPosition: controller.initalCameraPosition,
              mapType: MapType.normal,
              onMapCreated: (GoogleMapController c) {
                controller.googleMapController = c;
              },
              myLocationButtonEnabled: false)),
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
            child: TextField(
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                      icon: const Icon(FontAwesomeIcons.arrowRight),
                      onPressed: () {
                        if (controller.pointedAddress.value != null) {
                          Get.back(result: controller.pointedAddress.value);
                        }
                      }),
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(width: 0),
                      borderRadius: BorderRadius.circular(30)),
                  filled: true,
                  fillColor: Colors.white,
                  labelText: "Address"),
              readOnly: true,
              controller: controller.addressTextController,
              onTap: () => showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) => AddressSearchDialog(
                    geoMethods: controller.geoMethods,
                    onDone: (Address address) {
                      if (address.coords != null) {
                        _goToPoint(LatLng(address.coords!.latitude,
                                address.coords!.longitude))
                            .then((value) {
                          controller.pointedAddress(address);
                          controller.addressTextController.text = address
                                  .reference ??
                              "Unknown Place (${address.coords?.latitude}.${address.coords?.latitude})";
                        });
                      }
                    }),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(FontAwesomeIcons.mapLocation),
        onPressed: () async {
          controller.determinePosition().then((value) {
            return _goToPoint(LatLng(value.latitude, value.longitude))
                .then((_) {
              controller.geoMethods
                  .geoLocatePlace(
                      coords: Coords(value.latitude, value.longitude))
                  .then((value2) {
                controller.pointedAddress(value2);
                controller.addressTextController.text = value2?.reference ??
                    "Unknown Place (${value.latitude}.${value.longitude})";
              }).onError((error, stackTrace) {
                print(error);
              });
            });
          }).onError((error, stackTrace) {
            print(error);
          });
        },
      ),
    );
  }

  Future<void> _goToPoint(LatLng value) async {
    await controller.googleMapController.animateCamera(
        CameraUpdate.newCameraPosition(
            CameraPosition(target: value, zoom: 15.0)));
  }
}
