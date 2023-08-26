import 'dart:async';
import 'package:booking/commons/tabbar/tabbar_page.dart';
import 'package:booking/pages/user/signIn_page.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  Future<Object> futureCall() async {
    //TODO: Startup API call
    return Future<bool>.delayed(const Duration(seconds: 1), () => true)
        .then((value) => {
              if (value)
                {Get.offAllNamed(TabBarPage.path)}
              else
                {Get.offAllNamed(SignInPage.path)}
            }); //simulate Auth API
  }

  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.network(
          'https://cdn4.iconfinder.com/data/icons/logos-brands-5/24/flutter-512.png'),
      title: const Text(
        "Booking",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.teal.shade400,
      showLoader: true,
      loadingText: const Text("Loading..."),
      futureNavigator: futureCall(),
    );
  }
}
