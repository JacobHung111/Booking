import 'package:flutter/material.dart';

class SimpleButton extends StatelessWidget {
  const SimpleButton(
      {super.key,
      this.style = SimpleButtonStyle.confirm,
      this.title,
      this.onClick});
  final SimpleButtonStyle style;
  final String? title;
  final void Function()? onClick;

  @override
  Widget build(BuildContext context) {
    final child = title != null
        ? Text(title!,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ))
        : const Spacer();

    return style == SimpleButtonStyle.confirm
        ? ElevatedButton(onPressed: onClick, child: child)
        : OutlinedButton(onPressed: onClick, child: child);
  }
}

enum SimpleButtonStyle { confirm, cancel }
