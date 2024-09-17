import 'package:address_search_field/address_search_field.dart';
import 'package:booking/models/order_pending_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sprintf/sprintf.dart';

class OrderDetailController extends GetxController {
  OrderDetailModel? orderDetail;

  var dateTimeController = TextEditingController();
  var addressController = TextEditingController();
  var noOfRoomController = TextEditingController();
  var noOfOvenController = TextEditingController();
  var noOfToiletController = TextEditingController();
  var commentController = TextEditingController();
  var bonusController = TextEditingController();

  final DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm');

  samplePassData() {
    orderDetail = OrderDetailModel(
        address: Address(
            coords: const Coords(53.39292, -2.906592),
            reference: "102 Woolton Rd, Liverpool L15 6TH, UK",
            bounds: null,
            placeId: ''),
        date: DateTime(2023, 1, 1, 1, 1),
        comments:
            "GGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG",
        bonus: 12345,
        images: [
          "https://myaurochs.com/cdn/shop/articles/Is-Clear-a-Color_1024x.jpg",
          "https://ckhconsulting.com/wp-content/uploads/2021/07/pencil-test.jpeg",
          "https://cdn.vox-cdn.com/thumbor/Mj73hFVZY3mDRFus8WsOhzmo77M=/0x0:2040x1360/2000x1333/filters:focal(1020x680:1021x681)/cdn.vox-cdn.com/uploads/chorus_asset/file/12795165/acastro_180905_1777_0001.jpg",
          "https://myaurochs.com/cdn/shop/articles/Is-Clear-a-Color_1024x.jpg",
          "https://myaurochs.com/cdn/shop/articles/Is-Clear-a-Color_1024x.jpg",
          "https://myaurochs.com/cdn/shop/articles/Is-Clear-a-Color_1024x.jpg",
        ]);
    orderDetail?.option.grassCut = true;
  }

  updateUIFromDetail() {
    {
      if (orderDetail?.date != null) {
        dateTimeController.text = formatter.format(orderDetail!.date!);
      }
      addressController.text = orderDetail?.address?.reference ?? "";
      noOfRoomController.text = '${orderDetail?.option.rooms}';
      noOfOvenController.text = '${orderDetail?.option.ovenToClean}';
      noOfToiletController.text = '${orderDetail?.option.toilets}';
      bonusController.text = sprintf("%.2f", [(orderDetail?.bonus ?? 0) / 100]);
      commentController.text = orderDetail?.comments ?? "";
    }
  }
}
