import 'package:booking/views/pages/user/signin_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../common/loading_controller.dart';

class RemoveAccController extends GetxController {
  var password = "".obs;
  var confirmPassword = "".obs;
  var isFailed = false.obs;

  @override
  void onInit() {
    super.onInit();
    ever(password, (_) => isFailed(false));
    ever(confirmPassword, (_) => isFailed(false));
  }

  bool isValidate() {
    return !isFailed.value &&
        password.value == confirmPassword.value &&
        password.value.isNotEmpty; // TODO: password validation
  }

  removeOnClicked() {
    //TODO: API Called
    FocusManager.instance.primaryFocus?.unfocus();
    LoadingController.to.isLoading++;
    Future.delayed(const Duration(seconds: 1), () {
      LoadingController.to.isLoading--;
      if (true) {
        Get.offAllNamed(SignInPage.path);
      } else {
        isFailed(true);
      }
    });
  }
}
