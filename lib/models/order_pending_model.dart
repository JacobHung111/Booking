import 'package:address_search_field/address_search_field.dart';
import 'package:booking/models/order_create_model.dart';

class OrderPendingListModel {
  String? id;
  DateTime? date;
  Address? address;
  String? images;

  OrderPendingListModel({this.id, this.date, this.address, this.images});
}

class OrderDetailModel {
  DateTime? date;
  Address? address;
  OrderCreateOptionModel option = OrderCreateOptionModel();
  String? comments;
  int bonus = 0;
  List<String>? images;

  OrderDetailModel(
      {this.date, this.address, this.comments, this.bonus = 0, this.images});
}
