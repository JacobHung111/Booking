import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../common/loading_controller.dart';

class RegisterController extends GetxController {
  var email = "".obs;
  var otp = "".obs;
  var password = "".obs;
  var confirmPassword = "".obs;
  var counter = 120.obs;
  var isFailed = false.obs;

  @override
  void onInit() {
    super.onInit();
    ever(otp, (_) => isFailed(false));
    ever(email, (_) => isFailed(false));
    ever(password, (_) => isFailed(false));
    ever(confirmPassword, (_) => isFailed(false));
  }

  bool isValidate() {
    return EmailValidator.validate(email.value) &&
        otp.value.length == 8 &&
        !isFailed.value &&
        password.value == confirmPassword.value &&
        password.value.isNotEmpty; // TODO: password validation
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

  signUpOnClicked() {
    //TODO: API Called
    FocusManager.instance.primaryFocus?.unfocus();
    LoadingController.to.isLoading++;
    Future.delayed(const Duration(seconds: 1), () {
      LoadingController.to.isLoading--;
      if (false) {
        Get.back();
      } else {
        isFailed(true);
      }
    });
  }
}
