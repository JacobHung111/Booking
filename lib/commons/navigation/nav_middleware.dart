import 'package:booking/pages/user/signIn_page.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class NavigationMiddleWare {
  static final List<String> _darkStatusBarPages = [SignInPage.path];
  static observer(Routing? r) {
    if (_darkStatusBarPages.contains(r?.current)) {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    } else {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    }
  }
}
