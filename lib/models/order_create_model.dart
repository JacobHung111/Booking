import 'package:address_search_field/address_search_field.dart';
import 'package:image_picker/image_picker.dart';

class OrderCreateListModel {
  DateTime? date;
  Address? address;
  OrderCreateOptionModel? option;
  String? comments;
  int bonus = 0;
  List<XFile>? images;

  OrderCreateListModel(
      {this.date,
      this.address,
      this.option,
      this.comments,
      this.bonus = 0,
      this.images});
}

class OrderCreateOptionModel {
  int rooms;
  int ovenToClean;
  int toilets;
  bool grassCut;
  bool workingWithDogs;

  OrderCreateOptionModel(this.rooms, this.ovenToClean, this.toilets,
      this.grassCut, this.workingWithDogs);
}
