import 'package:booking/controllers/common/loading_controller.dart';
import 'package:booking/pages/commons/tabbar_page.dart';
import 'package:get/get.dart';

class SignInController {
  var email = "".obs;
  var password = "".obs;

  var signInOnClicked = () {
    //TODO: API Called
    LoadingController.to.isLoading++;
    Future.delayed(const Duration(seconds: 3), () {
      LoadingController.to.isLoading--;
      Get.offAllNamed(TabBarPage.path);
    });
  };
}
