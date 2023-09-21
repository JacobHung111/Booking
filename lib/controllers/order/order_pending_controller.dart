import 'package:address_search_field/address_search_field.dart';
import 'package:booking/controllers/common/loading_controller.dart';
import 'package:booking/models/order_pending_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class OrderPendingController extends GetxController {
  RxList<OrderPendingListModel> penderList = <OrderPendingListModel>[].obs;
  final DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm');

  callPendingListAPI() {
    FocusManager.instance.primaryFocus?.unfocus();
    LoadingController.to.isLoading++;
    Future.delayed(const Duration(seconds: 1), () {
      LoadingController.to.isLoading--;
      penderList([
        OrderPendingListModel(
            images: Uri.tryParse(
                    "https://myaurochs.com/cdn/shop/articles/Is-Clear-a-Color_1024x.jpg")
                .toString(),
            id: "1",
            date: DateTime(2023, 1, 1, 1, 1),
            address: Address(
                coords: null,
                bounds: null,
                reference: "testing address 1",
                placeId: null)),
        OrderPendingListModel(
            id: "2",
            date: DateTime(2023, 12, 12, 12, 12),
            address: Address(
                coords: null,
                bounds: null,
                reference: "testing address 2",
                placeId: null)),
        OrderPendingListModel(
            images: Uri.tryParse(
                    "https://ckhconsulting.com/wp-content/uploads/2021/07/pencil-test.jpeg")
                .toString(),
            id: "3",
            date: DateTime(2023, 6, 30, 23, 23),
            address: Address(
                coords: null,
                bounds: null,
                reference: "testing address 3",
                placeId: null))
      ]);
    });
  }
}
