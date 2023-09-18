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
      icon: FaIcon(FontAwesomeIcons.clockRotateLeft),
      label: 'Pending',
    ),
    BottomNavigationBarItem(
      icon: FaIcon(FontAwesomeIcons.star),
      label: 'Active',
    ),
    BottomNavigationBarItem(
      icon: FaIcon(FontAwesomeIcons.timeline),
      label: 'History',
    )
  ];

  final List<Widget> _topbarActions = [
    IconButton(
        onPressed: () => Get.toNamed(OrderCreatePage.path),
        icon: const FaIcon(FontAwesomeIcons.handSparkles)),
    IconButton(
        onPressed: () => Get.toNamed(ProfilePage.path),
        icon: const FaIcon(FontAwesomeIcons.user)),
    IconButton(
        onPressed: () => (),
        icon: const FaIcon(FontAwesomeIcons.whatsapp)), //TODO: add phone call
    IconButton(
        onPressed: () => Get.offAllNamed(SignInPage.path),
        icon: const FaIcon(FontAwesomeIcons.eject)) //TODO: Logout function
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
