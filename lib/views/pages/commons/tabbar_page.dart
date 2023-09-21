import 'package:booking/views/pages/user/signin_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
      icon: Icon(FontAwesomeIcons.clockRotateLeft),
      label: 'Pending',
    ),
    BottomNavigationBarItem(
      icon: Icon(FontAwesomeIcons.star),
      label: 'Active',
    ),
    BottomNavigationBarItem(
      icon: Icon(FontAwesomeIcons.timeline),
      label: 'History',
    )
  ];

  final List<Widget> _topbarActions = [
    IconButton(
        onPressed: () => Get.toNamed(OrderCreatePage.path),
        icon: const Icon(FontAwesomeIcons.handSparkles)),
    IconButton(
        onPressed: () => Get.toNamed(ProfilePage.path),
        icon: const Icon(FontAwesomeIcons.user)),
    IconButton(
        onPressed: () {},
        icon: const Icon(FontAwesomeIcons.whatsapp)), //TODO: add phone call
    IconButton(
        onPressed: () => Get.offAllNamed(SignInPage.path),
        icon: const Icon(FontAwesomeIcons.eject)) //TODO: Logout function
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
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
