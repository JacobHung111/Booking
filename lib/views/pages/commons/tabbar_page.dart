import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/common/tabbar_controller.dart';
import '../order/orders_active_page.dart';
import '../order/orders_history_page.dart';
import '../order/orders_pending_page.dart';
import '../order/order_create_page.dart';
import '../user/profile_page.dart';

class TabBarPage extends GetView<TabbarController> {
  TabBarPage({super.key});

  static const String path = '/';

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
    return Scaffold(
        appBar: AppBar(
          actions: _topbarActions,
        ),
        bottomNavigationBar: Obx(() => BottomNavigationBar(
              items: _tabbarItems,
              currentIndex: controller.currentIndex.value,
              onTap: (value) => controller.currentIndex(value),
            )),
        body: Obx(() => IndexedStack(
              index: controller.currentIndex(),
              children: _tabbarPages,
            )));
  }
}
