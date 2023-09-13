import 'dart:async';
import 'package:booking/pages/commons/tabbar_page.dart';
import 'package:booking/pages/user/signIn_page.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  static String path = '/splash';

  Future<Object> futureCall() async {
    //TODO: Startup API call
    return Future<bool>.delayed(const Duration(seconds: 1), () => false)
        .then((value) => {
              if (value)
                {Get.offAllNamed(TabBarPage.path)}
              else
                {Get.offAllNamed(SignInPage.path)}
            }); //simulate Auth API
  }

  @override
  Widget build(BuildContext context) {
    final Color color = Theme.of(context).colorScheme.primary;
    final Color bgcolor = Theme.of(context).colorScheme.background;
    return EasySplashScreen(
      logo: Image.network(
        'https://cdn4.iconfinder.com/data/icons/logos-brands-5/24/flutter-512.png',
        color: color,
      ),
      title: Text(
        "Booking",
        style:
            TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: color),
      ),
      loaderColor: color,
      backgroundColor: bgcolor,
      showLoader: true,
      loadingText: Text("Loading...", style: TextStyle(color: color)),
      futureNavigator: futureCall(),
    );
  }
}
