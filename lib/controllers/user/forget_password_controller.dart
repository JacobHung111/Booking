import 'package:booking/controllers/common/loading_controller.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  var email = "".obs;
  var otp = "".obs;
  var newPassword = "".obs;
  var counter = 120.obs;
  var isFailed = false.obs;

  @override
  void onInit() {
    super.onInit();
    ever(otp, (_) => isFailed(false));
    ever(email, (_) => isFailed(false));
    ever(newPassword, (_) => isFailed(false));
  }

  bool isValidate() {
    return EmailValidator.validate(email.value) &&
        otp.value.length == 8 &&
        !isFailed.value &&
        newPassword.value.isNotEmpty; // TODO: password validation
  }

  bool isOtpCanSend() {
    return counter.value == 120 && EmailValidator.validate(email.value);
  }

  otpOnClicked() {
    //TODO: API Called
    FocusManager.instance.primaryFocus?.unfocus();
    LoadingController.to.isLoading++;
    Future.delayed(const Duration(seconds: 1), () {
      LoadingController.to.isLoading--;
      _startCountdown();
    });
  }

  _startCountdown() {
    if (counter.value > 0) {
      counter--;
      Future.delayed(const Duration(seconds: 1), () {
        _startCountdown();
      });
    } else {
      counter(120);
    }
  }

  forgetOnClicked() {
    //TODO: API Called
    FocusManager.instance.primaryFocus?.unfocus();
    LoadingController.to.isLoading++;
    Future.delayed(const Duration(seconds: 1), () {
      LoadingController.to.isLoading--;
      if (true) {
        Get.back();
      } else {
        isFailed(true);
      }
    });
  }
}
