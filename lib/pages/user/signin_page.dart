import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../commons/tabbar_page.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});
  static const String path = "/signIn";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.teal,
        body: Center(
            child: TextButton(
          child: const Text(
            'Sign In',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () => Get.offAllNamed(TabBarPage.path),
        )));
  }
}
