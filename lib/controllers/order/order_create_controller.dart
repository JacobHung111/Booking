import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../models/order_create_model.dart';
import '../common/loading_controller.dart';

class OrderCreateController extends GetxController {
  var orderDetail = OrderCreateListModel().obs;

  var dateTimeController = TextEditingController();

  final DateFormat formatter = DateFormat('yyyy-MM-dd hh:mm');

  createOnClicked() {
    FocusManager.instance.primaryFocus?.unfocus();
    LoadingController.to.isLoading++;
    Future.delayed(const Duration(seconds: 1), () {
      LoadingController.to.isLoading--;
      if (true) {
        Get.back();
      } else {
        //
      }
    });
  }
}
