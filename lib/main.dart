import 'package:booking/commons/navigation/nav_middleware.dart';
import 'package:booking/commons/navigation/nav_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

import 'views/pages/commons/loading_page.dart';
import 'views/pages/commons/splash_page.dart';

void main() {
  runApp(ProviderScope(child: LoadingPage(underLoading: mainApp())));
}

Widget mainApp() {
  ThemeData theme = ThemeData(
    brightness: Brightness.light,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: Colors
          .red, //fullbtn bg, textbtn text, textbtn underline, navbar bg, selected icon color
      onPrimary: Colors.blue, //fullbtn text, navbar text, navbar icon
      secondary: Colors.orange,
      onSecondary: Colors.grey,
      error: Colors.white,
      onError: Colors.black,
      background: Colors.yellow,
      onBackground: Colors.purple,
      surface: Colors.blueGrey,
      onSurface: Colors.green, //btn border, disabled btn, textfield border
    ),
  );

  return GetMaterialApp(
    theme: theme,
    initialRoute: SplashPage.path,
    getPages: NavigationRoute.route,
    routingCallback: NavigationMiddleWare.observer,
  );
}
