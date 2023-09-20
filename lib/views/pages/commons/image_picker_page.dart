import 'dart:io';

import 'package:booking/controllers/common/image_picker_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ImagePickerPage extends GetView<ImagePickerController> {
  const ImagePickerPage({super.key});
  static String path = "/imagePicker";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                Get.back(
                    result: controller.imageListInList
                        .where((p0) => p0.$3)
                        .map((e) => (e.$1, e.$2))
                        .toList());
              },
              child: const Text("Import"))
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Obx(() => GridView.builder(
              padding:
                  EdgeInsets.only(bottom: controller.buttonsPosition.value),
              itemCount: controller.imageListInList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 5, crossAxisSpacing: 5),
              itemBuilder: (context, index) {
                return _gridItemView(context, index);
              }))),
      floatingActionButton: Column(
          key: controller.key,
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton.filledTonal(
                iconSize: 35,
                padding: const EdgeInsets.all(15),
                onPressed: () => controller.openCamera(),
                icon: const FaIcon(FontAwesomeIcons.cameraRetro)),
            const SizedBox(height: 20),
            IconButton.filled(
                iconSize: 30,
                padding: const EdgeInsets.all(15),
                onPressed: () => controller.openPhotoLib(),
                icon: const FaIcon(FontAwesomeIcons.solidImages))
          ]),
    );
  }

  Widget? _gridItemView(BuildContext context, int index) {
    var value = controller.imageListInList[index];
    var filename = value.$1;
    var filepath = value.$2;
    var selected = value.$3;
    return GestureDetector(
        child: Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                border: Border.all(
                    width: 2,
                    color: value.$3
                        ? Theme.of(context).primaryColor
                        : Colors.transparent)),
            child: Stack(fit: StackFit.expand, children: [
              Image.file(File(filepath)),
              Positioned(
                  right: 10,
                  bottom: 10,
                  child: FaIcon(
                    value.$3
                        ? FontAwesomeIcons.solidCircleCheck
                        : FontAwesomeIcons.circle,
                    size: 30,
                    color: Theme.of(context).primaryColor,
                  )),
            ])),
        onTap: () {
          controller.imageList[filename] = (filepath, !selected);
        });
  }
}
