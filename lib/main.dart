import 'package:booking/commons/tabbar/tabbar_controller.dart';
import 'package:booking/commons/tabbar/tabbar_page.dart';
import 'package:booking/pages/order/order_create_page.dart';
import 'package:booking/pages/user/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(mainApp());
}

Widget mainApp() {
  var theme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.teal,
  );
  return GetMaterialApp(
    theme: theme,
    initialRoute: '/',
    initialBinding: BindingsBuilder(() {
      Get.lazyPut(() => TabbarController());
    }),
    getPages: [
      GetPage(name: '/', page: () => TabBarPage()),
      GetPage(name: OrderCreatePage.path, page: () => const OrderCreatePage()),
      GetPage(name: ProfilePage.path, page: () => const ProfilePage()),
    ],
  );
}
