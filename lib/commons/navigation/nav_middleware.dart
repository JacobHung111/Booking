import 'package:booking/pages/user/signIn_page.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class NavigationMiddleWare {
  static final List<String> _darkStatusBarPages = [SignInPage.path];
  static observer(Routing? r) {
    // waiting for navigate animation
    Future.delayed(const Duration(milliseconds: 100), () {
      if (_darkStatusBarPages.contains(r?.current)) {
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
      } else {
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
      }
    });
  }
}
