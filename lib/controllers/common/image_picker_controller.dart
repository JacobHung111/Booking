import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerController extends GetxController {
  var imageList =
      <String, (String, bool)>{}.obs; // <fileName, (filePath, selected)>
  var imageListInList = RxList<(String, String, bool)>([]);
  final ImagePicker _picker = ImagePicker();
  var buttonsPosition = RxDouble(0);
  GlobalKey key = GlobalKey();

  @override
  void onInit() {
    var image1 =
        Get.arguments as List<(String, String)>?; // (fileName, filePath)
    if (image1 != null) {
      Map<String, (String, bool)> image2 = {
        for (var i in image1) i.$1: (i.$2, true)
      };
      imageList(image2);
    }

    Future.delayed(const Duration(milliseconds: 100), () {
      RenderBox box = key.currentContext?.findRenderObject() as RenderBox;
      Offset position =
          box.localToGlobal(Offset.zero); //this is global position
      double y = position.dy;
      buttonsPosition(y);
    });
    ever(imageList, (callback) {
      List<(String, String, bool)> list =
          callback.entries.map((e) => (e.key, e.value.$1, e.value.$2)).toList();
      imageListInList(list);
    });

    super.onInit();
  }

  openCamera() {
    _picker.pickImage(source: ImageSource.camera).then((newImage) {
      if (newImage == null) return;
      imageList[newImage.name] = (newImage.path, true);
    });
  }

  openPhotoLib() {
    FilePicker.platform
        .pickFiles(
            type: FileType.image, allowMultiple: true, allowCompression: true)
        .then((value) {
      if (value != null) {
        for (var f in value.files) {
          if (f.path != null) {
            var name = f.name.split("-");
            name.removeLast();
            var name2 = name.join();
            imageList[name2] = (f.path!, true);
          }
        }
      }
    });
  }
}
