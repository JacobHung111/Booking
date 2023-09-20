import 'package:booking/controllers/order/order_create_controller.dart';
import 'package:booking/views/dialogs/datetime_dialogs.dart';
import 'package:booking/views/pages/commons/geo_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class OrderCreatePage extends GetView<OrderCreateController> {
  static const String path = "/createOrder";
  const OrderCreatePage({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).copyWith(
        useMaterial3: true,
        inputDecorationTheme: InputDecorationTheme(
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    width: 0.1, color: Theme.of(context).disabledColor)),
            floatingLabelStyle:
                TextStyle(color: Theme.of(context).primaryColor),
            labelStyle: TextStyle(color: Theme.of(context).disabledColor)));
    return Scaffold(
        appBar: AppBar(title: const Text("Create Order"), actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text("Submit"),
          )
        ]),
        body: Theme(
            data: theme,
            child: ListView(
              padding: const EdgeInsets.all(10),
              children: [
                Row(
                  children: [
                    Expanded(
                        child: TextField(
                            controller: controller.dateTimeController,
                            readOnly: true,
                            enabled: false,
                            style: const TextStyle(color: Colors.black),
                            decoration: const InputDecoration(
                              labelText: "Order Date & Time",
                            ))),
                    const SizedBox(width: 20),
                    Row(children: [
                      IconButton(
                          onPressed: () => DateTimeDialogs.showDialogPicker(
                                  context,
                                  "Order Date",
                                  controller.dateMax,
                                  controller.orderDetail.value.date, (value) {
                                controller.updateDateTime(value);
                              }),
                          icon: const FaIcon(FontAwesomeIcons.calendar)),
                      IconButton(
                          onPressed: () => DateTimeDialogs.showDialogTimePicker(
                                  context,
                                  "Order Time",
                                  controller.orderDetail.value.date, (value) {
                                controller.updateDateTime(value);
                              }),
                          icon: const FaIcon(FontAwesomeIcons.clock))
                    ])
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        child: TextField(
                            controller: controller.addressController,
                            readOnly: true,
                            enabled: false,
                            style: const TextStyle(color: Colors.black),
                            decoration:
                                const InputDecoration(labelText: "Address"))),
                    const SizedBox(width: 20),
                    IconButton(
                        onPressed: () {
                          Get.toNamed(GeoPage.path)?.then((address) {
                            controller.updateAddress(address);
                          });
                        },
                        icon: const FaIcon(FontAwesomeIcons.map))
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        child: TextField(
                            controller: controller.noOfRoomController,
                            readOnly: true,
                            enabled: false,
                            style: const TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                                labelText:
                                    "No. of Room (Max. ${controller.roomMax})"))),
                    const SizedBox(width: 20),
                    Row(children: [
                      IconButton(
                          onPressed: () => controller.updateNoOfRoom(true),
                          icon: const FaIcon(FontAwesomeIcons.plus)),
                      IconButton(
                          onPressed: () => controller.updateNoOfRoom(false),
                          icon: const FaIcon(FontAwesomeIcons.minus))
                    ])
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        child: TextField(
                            controller: controller.noOfOvenController,
                            readOnly: true,
                            enabled: false,
                            style: const TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                                labelText:
                                    "No. of Oven to clean (Max. ${controller.ovenMax})"))),
                    const SizedBox(width: 20),
                    Row(children: [
                      IconButton(
                          onPressed: () => controller.updateNoOfOven(true),
                          icon: const FaIcon(FontAwesomeIcons.plus)),
                      IconButton(
                          onPressed: () => controller.updateNoOfOven(false),
                          icon: const FaIcon(FontAwesomeIcons.minus))
                    ])
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        child: TextField(
                            controller: controller.noOfToiletController,
                            readOnly: true,
                            enabled: false,
                            style: const TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                                labelText:
                                    "No. of Toilets (Max. ${controller.toiletMax})"))),
                    const SizedBox(width: 20),
                    Row(children: [
                      IconButton(
                          onPressed: () => controller.updateNoOfToilet(true),
                          icon: const FaIcon(FontAwesomeIcons.plus)),
                      IconButton(
                          onPressed: () => controller.updateNoOfToilet(false),
                          icon: const FaIcon(FontAwesomeIcons.minus))
                    ])
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    children: [
                      Flexible(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Obx(() => Text("Cut Grass ",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: controller
                                          .orderDetail.value.option.grassCut
                                      ? theme.primaryColor
                                      : theme.disabledColor))),
                          Obx(() => Switch(
                              value:
                                  controller.orderDetail.value.option.grassCut,
                              onChanged: (value) {
                                controller.orderDetail.update((val) {
                                  val?.option.grassCut = value;
                                });
                              }))
                        ],
                      )),
                      Flexible(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Obx(() => Text("With Dog ",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: controller.orderDetail.value.option
                                          .workingWithDogs
                                      ? theme.primaryColor
                                      : theme.disabledColor))),
                          Obx(() => Switch(
                              value: controller
                                  .orderDetail.value.option.workingWithDogs,
                              onChanged: (value) {
                                controller.orderDetail.update((val) {
                                  val?.option.workingWithDogs = value;
                                });
                              }))
                        ],
                      ))
                    ],
                  ),
                ),
                TextField(
                  controller: controller.bonusController,
                  decoration: const InputDecoration(
                    labelText: "Extra Bonus",
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp('[0-9.]'))
                  ],
                  onSubmitted: (value) {
                    controller.updateExtraBonus(value);
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: TextField(
                    onChanged: (value) {
                      controller.updateComment(value);
                    },
                    maxLines: 10,
                    minLines: 4,
                    decoration: InputDecoration(
                        alignLabelWithHint: true,
                        border: const OutlineInputBorder(
                            borderSide: BorderSide(width: 1)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1.5,
                                color: theme.disabledColor.withAlpha(25))),
                        labelText: "Remarks for Cleaner"),
                  ),
                )
              ],
            )));
  }
}
