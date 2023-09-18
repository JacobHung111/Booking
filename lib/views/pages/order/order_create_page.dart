import 'package:booking/commons/widgets/textbox.dart';
import 'package:booking/controllers/order/order_create_controller.dart';
import 'package:booking/views/dialogs/datetime_dialogs.dart';
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
          icon: const FaIcon(FontAwesomeIcons.calculator)),
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
        appBar: AppBar(),
        body: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            TextField(
                controller: controller.dateTimeController,
                readOnly: true,
                decoration: InputDecoration(
                    counterText: '',
                    hintText: "Order Date & Time",
                    focusedBorder: const UnderlineInputBorder(),
                    enabledBorder: const UnderlineInputBorder(),
                    suffixIcon: Column(children: dateTimePicker)))
          ],
        ));
  }
}
