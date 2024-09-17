import 'package:flutter/material.dart';

class SimpleScrollView extends StatelessWidget {
  final Widget child;

  const SimpleScrollView({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return SingleChildScrollView(
          child: ConstrainedBox(
              constraints: constraints.copyWith(
                  minHeight: constraints.maxHeight, maxHeight: double.infinity),
              child: child));
    });
  }
}
