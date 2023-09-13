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
      this.limit}) {
    _isHidden = hideButton.obs;
  }

  final String? title;
  final TextInputType inputType;
  final bool hideButton;
  final RxString onChanged;
  final String? hintText;
  final bool isEnable;
  final int? limit;

  late final RxBool _isHidden;

  @override
  Widget build(BuildContext context) {
    return Obx(() => TextField(
        maxLength: limit,
        enabled: isEnable,
        textInputAction: TextInputAction.done,
        obscureText: _isHidden.value,
        keyboardType: inputType,
        decoration: InputDecoration(
          hintText: hintText,
          focusedBorder: const UnderlineInputBorder(),
          enabledBorder: const UnderlineInputBorder(),
          suffixIcon: hideButton
              ? IconButton(
                  onPressed: () {
                    _isHidden(!_isHidden.value);
                  },
                  icon: Icon(
                    _isHidden.value ? Icons.hide_source : Icons.remove_red_eye,
                  ))
              : null,
          labelText: title,
        ),
        onChanged: onChanged));
  }
}
