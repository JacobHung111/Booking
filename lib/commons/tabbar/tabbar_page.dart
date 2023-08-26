import 'package:booking/commons/tabbar/tabbar_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../pages/order/orders_active_page.dart';
import '../../pages/order/orders_history_page.dart';
import '../../pages/order/orders_pending_page.dart';
import '../../pages/order/order_create_page.dart';
import '../../pages/user/profile_page.dart';

class TabBarPage extends StatelessWidget {
  TabBarPage({super.key});

  static const String path = '/home';

  static const List<Widget> _tabbarPages = [
    OrderPendingPage(),
    OrderActivePage(),
    OrderHistoryPage()
  ];

  static const List<BottomNavigationBarItem> _tabbarItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.pending),
      label: 'Pending',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.receipt),
      label: 'Active',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.history),
      label: 'History',
    )
  ];

  final List<Widget> _topbarActions = [
    IconButton(
        onPressed: () => Get.toNamed(OrderCreatePage.path),
        icon: const Icon(Icons.create)),
    IconButton(
        onPressed: () => Get.toNamed(ProfilePage.path),
        icon: const Icon(Icons.supervised_user_circle)),
    IconButton(
        onPressed: () => (),
        icon: const Icon(Icons.call)), //TODO: add phone call
    IconButton(
        onPressed: () => {},
        icon: const Icon(Icons.logout)) //TODO: Logout function
  ];

  @override
  Widget build(BuildContext context) {
    final tc = TabbarController.to;
    return Scaffold(
        appBar: AppBar(
          actions: _topbarActions,
        ),
        bottomNavigationBar: Obx(() => BottomNavigationBar(
              items: _tabbarItems,
              currentIndex: tc.currentIndex.value,
              onTap: (value) => tc.currentIndex(value),
            )),
        body: Obx(() => IndexedStack(
              index: tc.currentIndex(),
              children: _tabbarPages,
            )));
  }
}
