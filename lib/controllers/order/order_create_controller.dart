import 'dart:math';

import 'package:address_search_field/address_search_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sprintf/sprintf.dart';

import '../../models/order_create_model.dart';
import '../common/loading_controller.dart';

class OrderCreateController extends GetxController {
  var orderDetail = OrderCreateListModel().obs;

  var dateTimeController = TextEditingController();
  var addressController = TextEditingController();
  var noOfRoomController = TextEditingController();
  var noOfOvenController = TextEditingController();
  var noOfToiletController = TextEditingController();
  var commentController = TextEditingController();
  var bonusController = TextEditingController();

  final DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm');

  final roomMax = 5;
  final ovenMax = 5;
  final toiletMax = 5;
  final dateMax = 30;

  updateNoOfRoom(bool add) {
    if (add) {
      orderDetail.update((val) {
        val?.option.rooms = min(roomMax, val.option.rooms + 1);
      });
    } else {
      orderDetail.update((val) {
        val?.option.rooms = max(0, val.option.rooms - 1);
      });
    }
    noOfRoomController.text = '${orderDetail.value.option.rooms}';
  }

  updateNoOfOven(bool add) {
    if (add) {
      orderDetail.update((val) {
        val?.option.ovenToClean = min(ovenMax, val.option.ovenToClean + 1);
      });
    } else {
      orderDetail.update((val) {
        val?.option.ovenToClean = max(0, val.option.ovenToClean - 1);
      });
    }
    noOfOvenController.text = '${orderDetail.value.option.ovenToClean}';
  }

  updateNoOfToilet(bool add) {
    if (add) {
      orderDetail.update((val) {
        val?.option.toilets = min(toiletMax, val.option.toilets + 1);
      });
    } else {
      orderDetail.update((val) {
        val?.option.toilets = max(0, val.option.toilets - 1);
      });
    }
    noOfToiletController.text = '${orderDetail.value.option.toilets}';
  }

  updateAddress(Address? address) {
    if (address != null) {
      orderDetail.update((val) {
        val?.address = address;
      });
      addressController.text = address.reference ?? "";
    }
  }

  updateDateTime(DateTime dateTime) {
    dateTimeController.text = formatter.format(dateTime);
    orderDetail.update((val) {
      val?.date = dateTime;
    });
  }

  updateComment(String s) {
    orderDetail.update((val) {
      val?.comments = s;
    });
    commentController.text = s;
  }

  updateExtraBonus(String bonus) {
    double d = double.tryParse(bonus) ?? 0;
    int b = (d * 100).round();
    orderDetail.update((val) {
      val?.bonus = b;
    });
    bonusController.text = sprintf("%.02f", [d]);
  }

  @override
  onInit() {
    super.onInit();
    noOfRoomController.text = '${orderDetail.value.option.rooms}';
    noOfOvenController.text = '${orderDetail.value.option.ovenToClean}';
    noOfToiletController.text = '${orderDetail.value.option.toilets}';
    bonusController.text = sprintf("%.2f", [orderDetail.value.bonus / 100]);
  }

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
