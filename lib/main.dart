import 'package:booking/controllers/common/loading_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/common/tabbar_controller.dart';
import 'pages/commons/loading_page.dart';
import 'pages/commons/splash_page.dart';
import 'pages/commons/tabbar_page.dart';
import 'pages/order/order_create_page.dart';
import 'pages/user/profile_page.dart';
import 'pages/user/signIn_page.dart';

void main() {
  runApp(LoadingPage(underLoading: mainApp()));
}

Widget mainApp() {
  var routes = [
    GetPage(name: SplashPage.path, page: () => const SplashPage()),
    GetPage(
        name: SignInPage.path,
        page: () => const SignInPage(),
        transition: Transition.downToUp,
        fullscreenDialog: true),
    GetPage(
        name: TabBarPage.path,
        page: () => TabBarPage(),
        binding: BindingsBuilder(() {
          Get.lazyPut(() => TabbarController());
        }),
        transition: Transition.noTransition,
        fullscreenDialog: true),
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

  Future.delayed(
      const Duration(seconds: 10), () => LoadingController.to.isLoading(0));

  return GetMaterialApp(
    theme: theme,
    initialRoute: SplashPage.path,
    getPages: routes,
  );
}
