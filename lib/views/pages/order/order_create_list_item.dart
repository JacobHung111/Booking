import 'package:flutter/material.dart';

class OrderCreateListItemView extends StatelessWidget {
  const OrderCreateListItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

enum OrderCreateListItemType {
  date,
  string,
  number,
  money;
}
