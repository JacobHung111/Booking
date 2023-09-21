import 'package:address_search_field/address_search_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../controllers/common/geo_controller.dart';

class GeoPage extends GetView<GeoController> {
  const GeoPage({super.key});
  static String path = '/geo';

  @override
  Widget build(BuildContext context) {
    bool enabled = Get.arguments?['enabled'] as bool? ?? true;
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
                if (controller.waitForCamera != null) {
                  controller.goToPoint(controller.waitForCamera!);
                  controller.waitForCamera = null;
                }
              },
              myLocationButtonEnabled: false)),
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
            child: TextField(
              enabled: enabled,
              decoration: InputDecoration(
                  suffixIcon: enabled
                      ? IconButton(
                          icon: const Icon(FontAwesomeIcons.arrowRight),
                          onPressed: () {
                            if (controller.pointedAddress.value != null) {
                              Get.back(result: controller.pointedAddress.value);
                            }
                          })
                      : null,
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(width: 0),
                      borderRadius: BorderRadius.circular(30)),
                  filled: true,
                  fillColor: Colors.white,
                  labelText: "Address"),
              readOnly: true,
              controller: controller.addressTextController,
              onTap: enabled
                  ? () => showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) => AddressSearchDialog(
                            geoMethods: controller.geoMethods,
                            onDone: (Address address) {
                              if (address.coords != null) {
                                controller.pointedAddress(address);
                              }
                            }),
                      )
                  : null,
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(enabled
            ? FontAwesomeIcons.locationCrosshairs
            : FontAwesomeIcons.mapLocationDot),
        onPressed: () async {
          if (enabled) {
            controller.determinePosition().then((value) {
              return controller.geoMethods
                  .geoLocatePlace(
                      coords: Coords(value.latitude, value.longitude))
                  .then((value2) {
                controller.pointedAddress(value2);
              }).onError((error, stackTrace) {
                print(error);
              });
            }).onError((error, stackTrace) {
              print(error);
            });
          } else if (controller.pointedAddress.value?.coords != null) {
            var latlong = LatLng(
                controller.pointedAddress.value!.coords!.latitude,
                controller.pointedAddress.value!.coords!.longitude);
            controller.goToPoint(latlong);
          }
        },
      ),
    );
  }
}
