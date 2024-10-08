import 'package:address_search_field/address_search_field.dart';

class OrderCreateListModel {
  DateTime? date;
  Address? address;
  OrderCreateOptionModel option = OrderCreateOptionModel();
  String? comments;
  int bonus = 0;
  List<(String, String)>? images;

  OrderCreateListModel(
      {this.date, this.address, this.comments, this.bonus = 0, this.images});
}

class OrderCreateOptionModel {
  int rooms = 0;
  int ovenToClean = 0;
  int toilets = 0;
  bool grassCut = false;
  bool workingWithDogs = false;

  OrderCreateOptionModel();
}
