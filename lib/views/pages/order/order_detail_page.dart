import 'package:booking/commons/widgets/simplenetworkimage.dart';
import 'package:booking/controllers/order/order_detail_controller.dart';
import 'package:booking/models/order_pending_model.dart';
import 'package:booking/views/dialogs/networkimage_hero.dart';
import 'package:booking/views/pages/commons/geo_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class OrderDetailPage extends GetView<OrderDetailController> {
  static const String path = "/orderDetail";
  const OrderDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    // sample pass data
    controller.samplePassData();
    // controller.orderDetail = (Get.arguments as OrderDetailModel?);
    var imageList = controller.orderDetail?.images ?? [];
    controller.updateUIFromDetail();
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
        appBar: AppBar(title: const Text("Order Detail")),
        body: Theme(
            data: theme,
            child: ListView(
              padding: const EdgeInsets.all(10).copyWith(bottom: 20),
              children: [
                TextField(
                    controller: controller.dateTimeController,
                    enabled: false,
                    style: const TextStyle(color: Colors.black),
                    decoration: const InputDecoration(
                      labelText: "Order Date & Time",
                    )),
                Row(
                  children: [
                    Expanded(
                        child: TextField(
                            maxLines: 3,
                            minLines: 1,
                            controller: controller.addressController,
                            enabled: false,
                            style: const TextStyle(color: Colors.black),
                            decoration:
                                const InputDecoration(labelText: "Address"))),
                    const SizedBox(width: 20),
                    IconButton(
                        onPressed: () {
                          if (controller.orderDetail?.address != null) {
                            Get.toNamed(GeoPage.path, arguments: {
                              'enabled': false,
                              'address': controller.orderDetail?.address
                            });
                          }
                        },
                        icon: const Icon(FontAwesomeIcons.map))
                  ],
                ),
                TextField(
                    controller: controller.noOfRoomController,
                    enabled: false,
                    style: const TextStyle(color: Colors.black),
                    decoration:
                        const InputDecoration(labelText: "No. of Room")),
                TextField(
                    controller: controller.noOfOvenController,
                    enabled: false,
                    style: const TextStyle(color: Colors.black),
                    decoration: const InputDecoration(
                        labelText: "No. of Oven to clean")),
                TextField(
                    controller: controller.noOfToiletController,
                    enabled: false,
                    style: const TextStyle(color: Colors.black),
                    decoration:
                        const InputDecoration(labelText: "No. of Toilets")),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    children: [
                      Flexible(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Cut Grass ",
                              style: TextStyle(
                                  fontSize: 20,
                                  color:
                                      controller.orderDetail?.option.grassCut ??
                                              false
                                          ? theme.primaryColor
                                          : theme.disabledColor)),
                          Switch(
                              value: controller.orderDetail?.option.grassCut ??
                                  false,
                              onChanged: null)
                        ],
                      )),
                      Flexible(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("With Dog ",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: controller.orderDetail?.option
                                              .workingWithDogs ??
                                          false
                                      ? theme.primaryColor
                                      : theme.disabledColor)),
                          Switch(
                              value: controller
                                      .orderDetail?.option.workingWithDogs ??
                                  false,
                              onChanged: null)
                        ],
                      ))
                    ],
                  ),
                ),
                imageList.isNotEmpty
                    ? SizedBox(
                        height: 120,
                        width: double.infinity,
                        child: GridView.builder(
                            itemCount: imageList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                  child: Card(
                                      child: Padding(
                                          padding: const EdgeInsets.all(5),
                                          child: Hero(
                                              tag: index,
                                              child: SimpleNetworkImage(
                                                uri: imageList[index],
                                                fit: BoxFit.fitHeight,
                                              )))),
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return NetworkImageHeroPage(
                                          uri: imageList[index], tag: index);
                                    }));
                                  });
                            },
                            scrollDirection: Axis.horizontal,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 1)))
                    : Container(),
                TextField(
                  enabled: false,
                  controller: controller.bonusController,
                  decoration: const InputDecoration(
                    labelText: "Extra Bonus",
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp('[0-9.]'))
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: TextField(
                    enabled: false,
                    controller: controller.commentController,
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
