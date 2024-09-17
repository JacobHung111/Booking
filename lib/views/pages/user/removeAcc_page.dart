import 'package:booking/controllers/user/remove_acc_controller.dart';
import 'package:flutter/material.dart';
import 'package:booking/commons/widgets/simplebutton.dart';
import 'package:booking/commons/widgets/textbox.dart';
import 'package:get/get.dart';

class RemoveAccPage extends GetView<RemoveAccController> {
  const RemoveAccPage({super.key});
  static const String path = '/removeAcc';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Remove Account"),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                  child: Column(children: [
                const Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Center(
                        child: Text(
                            "aaaaaaaaasslwkjghw oirghwoilrghrlghdfljghrsg si hfgseoifh sogh soih oisergh sorgiheps hgsrpig hpseigh sepghpiehgp isegh esilfjesioghjesipoghsogh pisgh sepigh seipg hsepifjseigseihgsi ipeh girsophg sighp ih pisehgrspifh seipesh ipesh gpisehg sepigh spiehg sepihg episgh espihg seiphg "))),
                Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextBox(
                              hintText: 'Password',
                              inputType: TextInputType.visiblePassword,
                              hideButton: true,
                              onChanged: controller.password),
                          TextBox(
                              hintText: 'Confirm Password',
                              inputType: TextInputType.visiblePassword,
                              hideButton: true,
                              onChanged: controller.confirmPassword)
                        ])),
                const Spacer(flex: 1)
              ])),
              Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Obx(() => SimpleButton(
                      title: "Remove",
                      onClick: controller.isValidate()
                          ? controller.removeOnClicked
                          : null)))
            ],
          )),
    );
  }
}
