import 'package:flutter/material.dart';

class OrderCreatePage extends StatelessWidget {
  const OrderCreatePage({super.key});
  static String path = "/createOrder";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(), body: const Center(child: Text("Order Create Page")));
  }
}
