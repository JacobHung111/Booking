import 'package:booking/views/pages/user/removeAcc_page.dart';
import 'package:booking/commons/widgets/simplebutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  static const String path = "/changeProfile";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
            child: SimpleButton(
                title: "Remove Account",
                onClick: () => Get.toNamed(RemoveAccPage.path))));
  }
}
