import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class TextBox extends StatelessWidget {
  TextBox(
      {super.key,
      this.title,
      this.inputType = TextInputType.text,
      this.hideButton = false,
      this.controller,
      this.onChanged,
      this.hintText,
      this.isEnable = true,
      this.limit}) {
    _isHidden = hideButton.obs;
  }

  final String? title;
  final TextInputType inputType;
  final bool hideButton;
  final TextEditingController? controller;
  final RxString? onChanged;
  final String? hintText;
  final bool isEnable;
  final int? limit;

  late final RxBool _isHidden;

  @override
  Widget build(BuildContext context) {
    return Obx(() => TextField(
        controller: controller,
        maxLength: limit,
        enabled: isEnable,
        textInputAction: TextInputAction.done,
        obscureText: _isHidden.value,
        keyboardType: inputType,
        decoration: InputDecoration(
          counterText: '',
          hintText: hintText,
          focusedBorder: const UnderlineInputBorder(),
          enabledBorder: const UnderlineInputBorder(),
          suffixIcon: hideButton
              ? IconButton(
                  onPressed: () {
                    _isHidden(!_isHidden.value);
                  },
                  icon: FaIcon(_isHidden.value
                      ? FontAwesomeIcons.eye
                      : FontAwesomeIcons.eyeSlash))
              : null,
          labelText: title,
        ),
        onChanged: (s) {
          onChanged?.update((val) => val = s);
        }));
  }
}
