import 'package:image_picker/image_picker.dart';

class OrderCreateListModel {
  DateTime? date;
  OrderCreateAddressModel? address;
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

class OrderCreateAddressModel {
  String address;
  String locality;
  String postCode;
  String country;

  OrderCreateAddressModel(
      this.address, this.locality, this.postCode, this.country);
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
