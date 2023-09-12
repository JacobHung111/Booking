import 'package:booking/controllers/user/forget_password_controller.dart';
import 'package:booking/pages/user/forget_password_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/common/tabbar_controller.dart';
import 'controllers/user/signin_controller.dart';
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
        binding: BindingsBuilder(() {
          Get.lazyPut(() => SignInController());
        }),
        transition: Transition.noTransition,
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
    GetPage(
        name: ForgetPasswordPage.path,
        page: () => const ForgetPasswordPage(),
        binding: BindingsBuilder(() {
          Get.lazyPut(() => ForgetPasswordController());
        }))
  ];

  var theme = ThemeData(
      colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Colors.red,
          onPrimary: Colors.green,
          secondary: Colors.blue,
          onSecondary: Colors.yellow,
          error: Colors.orange,
          onError: Colors.teal,
          background: Colors.lime,
          onBackground: Colors.purple,
          surface: Colors.blueGrey,
          onSurface: Colors.brown));

  return GetMaterialApp(
    theme: theme,
    initialRoute: SplashPage.path,
    getPages: routes,
  );
}
