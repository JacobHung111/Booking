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
      useMaterial3: true,
      colorSchemeSeed: Colors.indigo,
      appBarTheme: const AppBarTheme(
          elevation: 3, scrolledUnderElevation: 6, shadowColor: Colors.black));

  return GetMaterialApp(
    theme: theme,
    initialRoute: SplashPage.path,
    getPages: NavigationRoute.route,
    routingCallback: NavigationMiddleWare.observer,
  );
}
