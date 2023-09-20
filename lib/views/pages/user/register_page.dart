import 'package:booking/commons/widgets/scrollview.dart';
import 'package:booking/controllers/user/register_controller.dart';
import 'package:booking/commons/widgets/simplebutton.dart';
import 'package:flutter/material.dart';
import 'package:booking/commons/widgets/textbox.dart';
import 'package:get/get.dart';
import 'package:sprintf/sprintf.dart';

class RegisterPage extends GetView<RegisterController> {
  const RegisterPage({super.key});
  static const String path = '/signUp';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: SimpleScrollView(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      Row(
                        children: [
                          Flexible(
                              child: Obx(() => TextBox(
                                  hintText: 'Email',
                                  inputType: TextInputType.emailAddress,
                                  isEnable: controller.counter.value == 120,
                                  onChanged: controller.email))),
                          const SizedBox(width: 10),
                          Obx(() => SimpleButton(
                              style: SimpleButtonStyle.cancel,
                              title: controller.counter.value == 120
                                  ? "Send"
                                  : sprintf(
                                      "%03is", [controller.counter.value]),
                              onClick: controller.isOtpCanSend()
                                  ? controller.otpOnClicked
                                  : null))
                        ],
                      ),
                      const SizedBox(height: 10),
                      TextBox(
                          limit: 8,
                          hintText: 'OTP Code',
                          inputType: TextInputType.number,
                          onChanged: controller.otp),
                      const SizedBox(height: 10),
                      TextBox(
                        hintText: 'User Name',
                        inputType: TextInputType.text,
                        onChanged: controller.userName,
                      ),
                      const SizedBox(height: 10),
                      TextBox(
                        hintText: 'Phone',
                        inputType: TextInputType.phone,
                        onChanged: controller.phoneNum,
                      ),
                      const SizedBox(height: 10),
                      TextBox(
                          hintText: 'Password',
                          inputType: TextInputType.visiblePassword,
                          hideButton: true,
                          onChanged: controller.password),
                      const SizedBox(height: 10),
                      TextBox(
                          hintText: 'Confirm Password',
                          inputType: TextInputType.visiblePassword,
                          hideButton: true,
                          onChanged: controller.password)
                    ])),
              ),
              Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Obx(() => SimpleButton(
                      title: "Sign Up",
                      onClick: controller.isValidate()
                          ? controller.signUpOnClicked
                          : null)))
            ],
          )),
    );
  }
}
