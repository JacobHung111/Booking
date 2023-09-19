import 'package:address_search_field/address_search_field.dart';
import 'package:booking/controllers/order/order_create_controller.dart';
import 'package:booking/views/dialogs/datetime_dialogs.dart';
import 'package:booking/views/pages/commons/geo_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class OrderCreatePage extends GetView<OrderCreateController> {
  static const String path = "/createOrder";
  const OrderCreatePage({super.key});

  @override
  Widget build(BuildContext context) {
    //Date Time Picker
    List<Widget> dateTimePicker = [
      IconButton(
          onPressed: () => DateTimeDialogs.showDialogPicker(
                  context, "Order Date", 30, controller.orderDetail.value.date,
                  (value) {
                controller.dateTimeController.text =
                    controller.formatter.format(value);
                controller.orderDetail.update((val) {
                  val?.date = value;
                });
              }),
          icon: const FaIcon(FontAwesomeIcons.calendar)),
      IconButton(
          onPressed: () => DateTimeDialogs.showDialogTimePicker(
                  context, "Order Date", controller.orderDetail.value.date,
                  (value) {
                controller.dateTimeController.text =
                    controller.formatter.format(value);
                controller.orderDetail.update((val) {
                  val?.date = value;
                });
              }),
          icon: const FaIcon(FontAwesomeIcons.clock))
    ];

    return Scaffold(
        appBar: AppBar(title: const Text("Create Order")),
        body: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            Row(
              children: [
                Expanded(
                    child: TextField(
                        controller: controller.dateTimeController,
                        readOnly: true,
                        enabled: false,
                        decoration: const InputDecoration(
                          counterText: '',
                          labelText: "Order Date & Time",
                        ))),
                Row(children: dateTimePicker)
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: TextField(
                        controller: controller.addressController,
                        readOnly: true,
                        enabled: false,
                        decoration: const InputDecoration(
                          counterText: '',
                          labelText: "Address",
                        ))),
                IconButton(
                    onPressed: () {
                      Get.toNamed(GeoPage.path)?.then((address) {
                        controller.orderDetail.update((val) {
                          val?.address = address;
                        });
                        controller.addressController.text =
                            (address as Address?)?.reference ?? "";
                      });
                    },
                    icon: const FaIcon(FontAwesomeIcons.map))
              ],
            ),
          ],
        ));
  }
}
