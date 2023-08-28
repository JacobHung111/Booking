import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextBox extends StatelessWidget {
  TextBox(
      {super.key,
      required this.title,
      this.inputType = TextInputType.text,
      this.hideButton = false,
      required this.onChanged,
      this.isDark = false}) {
    _boxColor = isDark ? Colors.white : Colors.black;
  }

  final String title;
  final TextInputType inputType;
  final bool hideButton;
  final RxString onChanged;
  final bool isDark;

  late final Color _boxColor;

  final isHidden = false.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(() => TextField(
        style: TextStyle(color: _boxColor),
        textInputAction: TextInputAction.done,
        obscureText: isHidden.value,
        keyboardType: inputType,
        decoration: InputDecoration(
            focusedBorder:
                UnderlineInputBorder(borderSide: BorderSide(color: _boxColor)),
            enabledBorder:
                UnderlineInputBorder(borderSide: BorderSide(color: _boxColor)),
            suffixIcon: hideButton
                ? IconButton(
                    onPressed: () {
                      isHidden(!isHidden.value);
                    },
                    icon: Icon(
                      isHidden.value ? Icons.hide_source : Icons.remove_red_eye,
                      color: _boxColor,
                    ))
                : null,
            labelText: title,
            labelStyle: TextStyle(color: _boxColor)),
        onChanged: onChanged));
  }
}
