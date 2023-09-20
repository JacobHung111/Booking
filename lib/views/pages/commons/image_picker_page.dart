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
    controller.layoutUpdate();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Image"),
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
      body: Obx(() => GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          itemCount: controller.imageListInList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 5, crossAxisSpacing: 5),
          itemBuilder: (context, index) {
            return _gridItemView(context, index);
          })),
      floatingActionButton: Column(mainAxisSize: MainAxisSize.min, children: [
        IconButton.filledTonal(
            iconSize: 35,
            padding: const EdgeInsets.all(15),
            onPressed: () => controller.openCamera(),
            icon: const Icon(FontAwesomeIcons.cameraRetro)),
        const SizedBox(height: 20),
        IconButton.filled(
            iconSize: 30,
            padding: const EdgeInsets.all(15),
            onPressed: () => controller.openPhotoLib(),
            icon: const Icon(FontAwesomeIcons.solidImages))
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
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                border: Border.all(
                    width: 1,
                    color: value.$3
                        ? Theme.of(context).primaryColor
                        : Colors.transparent)),
            child: Stack(fit: StackFit.expand, children: [
              Image.file(File(filepath)),
              Positioned(
                  right: 5,
                  bottom: 5,
                  child: Icon(
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
