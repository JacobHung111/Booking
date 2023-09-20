import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerController extends GetxController {
  var imageList = <String, (XFile, bool)>{}.obs;
  var imageListInList = RxList<(XFile, bool)>([]);
  final ImagePicker _picker = ImagePicker();
  var buttonsPosition = RxDouble(0);
  GlobalKey key = GlobalKey();

  @override
  void onInit() {
    var image1 = Get.arguments as List<XFile>?;
    if (image1 != null) {
      Map<String, (XFile, bool)> image2 = {
        for (var i in image1) i.name: (i, true)
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
      imageListInList(callback.values.toList());
    });

    super.onInit();
  }

  openCamera() {
    _picker.pickImage(source: ImageSource.camera).then((newImage) {
      if (newImage == null) return;
      imageList[newImage.name] = (newImage, true);
    });
  }

  openPhotoLib() {
    _picker.pickMultiImage().then((newImage) {
      for (var i in newImage) {
        imageList[i.name] = (i, true);
      }
    });
  }
}
