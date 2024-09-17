import 'package:booking/controllers/user/signin_controller.dart';
import 'package:booking/commons/widgets/simplebutton.dart';
import 'package:booking/commons/widgets/textbox.dart';
import 'package:booking/views/pages/user/user_suspend_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_login_buttons/social_login_buttons.dart';

class SignInPage extends GetView<SignInController> {
  const SignInPage({super.key});
  static const String path = "/signIn";

  @override
  Widget build(BuildContext context) {
    final isIOS = Theme.of(context).platform == TargetPlatform.iOS;
    final isAndroid = Theme.of(context).platform == TargetPlatform.android;

    List<Widget> socialLogin = [
      Flexible(
          child: SocialLoginButton(
        buttonType: SocialLoginButtonType.facebook,
        mode: SocialLoginButtonMode.single,
        text: "Facebook",
        onPressed: () {
          Get.to(() => const UserSuspendPage(reason: "Error"));
          controller.email.text = "";
          controller.password.text = "";
        },
      ))
    ];

    if (isIOS) {
      socialLogin.add(const SizedBox(width: 30));
      socialLogin.add(Flexible(
          child: SocialLoginButton(
        buttonType: SocialLoginButtonType.apple,
        mode: SocialLoginButtonMode.single,
        text: "Apple",
        onPressed: () {},
      )));
    }
    if (isAndroid) {
      socialLogin.add(const SizedBox(width: 30));
      socialLogin.add(Flexible(
          child: SocialLoginButton(
        buttonType: SocialLoginButtonType.google,
        mode: SocialLoginButtonMode.single,
        text: "Google",
        onPressed: () {},
      )));
    }

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
                      controller: controller.email)),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  child: TextBox(
                      title: 'Password',
                      hideButton: true,
                      controller: controller.password)),
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
      Flexible(
          flex: 2,
          fit: FlexFit.tight,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: socialLogin,
            ),
          ))
    ]));
  }
}
