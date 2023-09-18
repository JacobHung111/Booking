import 'package:booking/controllers/order/order_create_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderCreatePage extends GetView<OrderCreateController> {
  static const String path = "/createOrder";
  const OrderCreatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: ListView(
          padding: const EdgeInsets.all(10),
          children: [],
        ));
  }
}
