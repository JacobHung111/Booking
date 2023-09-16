import 'package:booking/controllers/user/remove_acc_controller.dart';
import 'package:booking/views/pages/user/removeAcc_page.dart';
import 'package:get/get.dart';

import '../../controllers/common/tabbar_controller.dart';
import '../../controllers/user/forget_password_controller.dart';
import '../../controllers/user/register_controller.dart';
import '../../controllers/user/signin_controller.dart';
import '../../views/pages/commons/splash_page.dart';
import '../../views/pages/commons/tabbar_page.dart';
import '../../views/pages/order/order_create_page.dart';
import '../../views/pages/user/forget_password_page.dart';
import '../../views/pages/user/profile_page.dart';
import '../../views/pages/user/register_page.dart';
import '../../views/pages/user/signIn_page.dart';

class NavigationRoute {
  static final List<GetPage> route = [
    GetPage(name: SplashPage.path, page: () => const SplashPage()),
    GetPage(
        name: SignInPage.path,
        page: () => const SignInPage(),
        binding: BindingsBuilder(() {
          Get.lazyPut(() => SignInController());
        }),
        transition: Transition.noTransition,
        fullscreenDialog: true),
    GetPage(
        name: TabBarPage.path,
        page: () => TabBarPage(),
        binding: BindingsBuilder(() {
          Get.lazyPut(() => TabbarController());
        }),
        transition: Transition.noTransition,
        fullscreenDialog: true),
    GetPage(
        name: OrderCreatePage.path,
        page: () => const OrderCreatePage(),
        transition: Transition.downToUp,
        fullscreenDialog: true),
    GetPage(
        name: ProfilePage.path,
        page: () => const ProfilePage(),
        transition: Transition.downToUp,
        fullscreenDialog: true),
    GetPage(
        name: ForgetPasswordPage.path,
        page: () => const ForgetPasswordPage(),
        binding: BindingsBuilder(() {
          Get.lazyPut(() => ForgetPasswordController());
        })),
    GetPage(
        name: RegisterPage.path,
        page: () => const RegisterPage(),
        binding: BindingsBuilder(() {
          Get.lazyPut(() => RegisterController());
        })),
    GetPage(
        name: RemoveAccPage.path,
        page: () => const RemoveAccPage(),
        binding: BindingsBuilder(() {
          Get.lazyPut(() => RemoveAccController());
        }))
  ];
}
