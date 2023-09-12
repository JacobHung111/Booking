import 'package:booking/controllers/user/signin_controller.dart';
import 'package:booking/widgets/simplebutton.dart';
import 'package:booking/widgets/textbox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInPage extends GetView<SignInController> {
  const SignInPage({super.key});
  static const String path = "/signIn";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Flexible(
          flex: 3,
          fit: FlexFit.tight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  child: TextBox(
                      title: 'Email',
                      inputType: TextInputType.emailAddress,
                      onChanged: controller.email)),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  child: TextBox(
                      title: 'Password',
                      hideButton: true,
                      onChanged: controller.password)),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: controller.forgetPassOnClicked,
                        style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            alignment: Alignment.topLeft),
                        child: const Text("Forget Password",
                            style: TextStyle(fontSize: 12))),
                    SimpleButton(
                        title: "Sign In", onClick: controller.signInOnClicked)
                  ],
                ),
              ),
              const SizedBox(height: 10),
              TextButton(
                  onPressed: controller.registerOnClicked,
                  child: const Text("New User? Let register now!",
                      style: TextStyle(
                          fontSize: 14, decoration: TextDecoration.underline)))
            ],
          )),
      const Flexible(
          flex: 2,
          fit: FlexFit.tight,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SimpleButton(title: "Social Login 1"),
              SizedBox(width: 30),
              SimpleButton(
                title: "Social Login 2",
                style: SimpleButtonStyle.cancel,
              ),
            ],
          ))
    ]));
  }
}
