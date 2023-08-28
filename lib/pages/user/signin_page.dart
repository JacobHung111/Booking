import 'package:booking/controllers/user/signin_controller.dart';
import 'package:booking/widgets/textbox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInPage extends GetView<SignInController> {
  const SignInPage({super.key});
  static const String path = "/signIn";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Column(children: [
          Flexible(
              flex: 3,
              fit: FlexFit.tight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 20),
                      child: TextBox(
                          title: 'Email',
                          inputType: TextInputType.emailAddress,
                          isDark: true,
                          onChanged: controller.email)),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 20),
                      child: TextBox(
                          title: 'Password',
                          hideButton: true,
                          isDark: true,
                          onChanged: controller.password)),
                  const SizedBox(height: 10),
                  TextButton(
                      onPressed: controller.signInOnClicked,
                      child: const Text('Sign In',
                          style: TextStyle(color: Colors.white, fontSize: 20)))
                ],
              )),
          const Flexible(
              flex: 2,
              fit: FlexFit.tight,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      child:
                          SizedBox(height: 70, child: Card(color: Colors.red))),
                  SizedBox(width: 30),
                  Expanded(
                      child:
                          SizedBox(height: 70, child: Card(color: Colors.red))),
                ],
              ))
        ]));
  }
}
