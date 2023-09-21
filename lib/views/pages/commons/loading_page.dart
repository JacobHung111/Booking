import 'package:booking/controllers/common/loading_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key, required this.underLoading});
  final Widget underLoading;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoadingController());
    return MaterialApp(
        home: GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Obx(() => Stack(fit: StackFit.expand, children: [
            underLoading,
            if (controller.isLoading.value > 0)
              Container(
                  height: double.infinity,
                  color: Colors.black.withOpacity(0.5),
                  child: const Center(child: CircularProgressIndicator()))
          ])),
    ));
  }
}
