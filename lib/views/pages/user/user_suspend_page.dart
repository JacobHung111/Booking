import 'package:booking/commons/widgets/simplebutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserSuspendPage extends StatelessWidget {
  const UserSuspendPage({super.key, required this.reason});
  final String reason;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(reason,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Theme.of(context).colorScheme.onPrimary)),
        const SizedBox(height: 20),
        SimpleButton(
          style: SimpleButtonStyle.confirm,
          title: "Other Account",
          onClick: () => Get.back(),
        )
      ])),
    );
  }
}
