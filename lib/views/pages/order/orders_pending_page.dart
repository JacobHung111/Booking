import 'package:booking/commons/widgets/simplenetworkimage.dart';
import 'package:booking/controllers/order/order_pending_controller.dart';
import 'package:booking/views/pages/order/order_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class OrderPendingPage extends GetView<OrderPendingController> {
  const OrderPendingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (controller.penderList.length > 1) {
          return ListView.builder(
              itemExtent: 120,
              itemBuilder: (context, index) => _listTile(context, index),
              itemCount: controller.penderList.length);
        } else {
          return Center(
              child: Text("No Pending Orders",
                  style: Theme.of(context).textTheme.headlineMedium));
        }
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.callPendingListAPI();
        },
        child: const Icon(FontAwesomeIcons.rotate),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget _listTile(BuildContext context, int index) {
    final data = controller.penderList.elementAtOrNull(index);
    return InkWell(
        child: Card(
            elevation: 2,
            child: Padding(
                padding: const EdgeInsets.all(5),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      data?.images != null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: AspectRatio(
                                aspectRatio: 1,
                                child: SimpleNetworkImage(
                                  uri: data!.images!,
                                  fit: BoxFit.fitHeight,
                                ),
                              ))
                          : Container(),
                      const SizedBox(width: 10),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Text(data?.address?.reference ?? "",
                                    maxLines: 2,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge)),
                            Text(
                                data?.date != null
                                    ? controller.formatter.format(data!.date!)
                                    : "",
                                style: Theme.of(context).textTheme.labelLarge)
                          ])
                    ]))),
        onTap: () {
          Get.toNamed(OrderDetailPage.path);
        });
  }
}
