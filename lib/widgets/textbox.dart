import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextBox extends StatelessWidget {
  TextBox(
      {super.key,
      this.title,
      this.inputType = TextInputType.text,
      this.hideButton = false,
      required this.onChanged,
      this.hintText,
      this.isEnable = true,
      this.limit});

  final String? title;
  final TextInputType inputType;
  final bool hideButton;
  final RxString onChanged;
  final String? hintText;
  final bool isEnable;
  final int? limit;

  final isHidden = false.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(() => TextField(
        maxLength: limit,
        enabled: isEnable,
        textInputAction: TextInputAction.done,
        obscureText: isHidden.value,
        keyboardType: inputType,
        decoration: InputDecoration(
          hintText: hintText,
          focusedBorder: const UnderlineInputBorder(),
          enabledBorder: const UnderlineInputBorder(),
          suffixIcon: hideButton
              ? IconButton(
                  onPressed: () {
                    isHidden(!isHidden.value);
                  },
                  icon: Icon(
                    isHidden.value ? Icons.hide_source : Icons.remove_red_eye,
                  ))
              : null,
          labelText: title,
        ),
        onChanged: onChanged));
  }
}
