import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerController extends GetxController {
  var imageList =
      <String, (String, bool)>{}.obs; // <fileName, (filePath, selected)>
  var imageListInList = RxList<(String, String, bool)>([]);
  final ImagePicker _picker = ImagePicker();
  var isIOS = false;

  @override
  void onInit() {
    super.onInit();
    ever(imageList, (callback) {
      List<(String, String, bool)> list =
          callback.entries.map((e) => (e.key, e.value.$1, e.value.$2)).toList();
      imageListInList(list);
    });
  }

  layoutUpdate() {
    var image1 =
        Get.arguments as List<(String, String)>?; // (fileName, filePath)
    if (image1 != null) {
      Map<String, (String, bool)> image2 = {
        for (var i in image1) i.$1: (i.$2, true)
      };
      imageList(image2);
    }
  }

  openCamera() {
    _picker
        .pickImage(source: ImageSource.camera, imageQuality: 50)
        .then((newImage) {
      if (newImage == null) return;
      imageList[newImage.name] = (newImage.path, true);
    });
  }

  openPhotoLib() {
    //Maybe need to bugfix for real devices
    FilePicker.platform
        .pickFiles(
            type: FileType.image, allowMultiple: true, allowCompression: true)
        .then((value) {
      if (value != null) {
        for (var f in value.files) {
          if (f.path != null) {
            if (isIOS) {
              var name = f.name.split("-");
              name.removeLast();
              var name2 = name.join();
              imageList[name2] = (f.path!, true);
            } else {
              imageList[f.name] = (f.path!, true);
            }
          }
        }
      }
    });
  }
}
