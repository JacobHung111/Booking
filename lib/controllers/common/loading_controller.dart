import 'package:get/get.dart';

class LoadingController extends GetxController {
  static LoadingController to = Get.find();
  var isLoading = 0.obs;
}
