import 'package:booking/controllers/common/loading_controller.dart';
import 'package:booking/views/pages/commons/tabbar_page.dart';
import 'package:booking/views/pages/user/forget_password_page.dart';
import 'package:booking/views/pages/user/register_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  var email = "".obs;
  var password = "".obs;

  signInOnClicked() {
    //TODO: API Called
    FocusManager.instance.primaryFocus?.unfocus();
    LoadingController.to.isLoading++;
    Future.delayed(const Duration(seconds: 3), () {
      LoadingController.to.isLoading--;
      Get.offAllNamed(TabBarPage.path);
    });
  }

  forgetPassOnClicked() {
    Get.toNamed(ForgetPasswordPage.path);
  }

  registerOnClicked() {
    Get.toNamed(RegisterPage.path);
  }
}
