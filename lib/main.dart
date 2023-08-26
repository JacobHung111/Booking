import 'package:booking/commons/tabbar/tabbar_controller.dart';
import 'package:booking/commons/tabbar/tabbar_page.dart';
import 'package:booking/pages/commons/splash_page.dart';
import 'package:booking/pages/order/order_create_page.dart';
import 'package:booking/pages/user/profile_page.dart';
import 'package:booking/pages/user/signIn_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(mainApp());
}

Widget mainApp() {
  var routes = [
    GetPage(name: '/', page: () => const SplashPage()),
    GetPage(
        name: SignInPage.path,
        page: () => const SignInPage(),
        transition: Transition.downToUp,
        fullscreenDialog: true),
    GetPage(name: TabBarPage.path, page: () => TabBarPage()),
    GetPage(
        name: OrderCreatePage.path,
        page: () => const OrderCreatePage(),
        transition: Transition.downToUp,
        fullscreenDialog: true),
    GetPage(
        name: ProfilePage.path,
        page: () => const ProfilePage(),
        transition: Transition.downToUp,
        fullscreenDialog: true),
  ];

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
    getPages: routes,
  );
}
