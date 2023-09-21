import 'package:booking/controllers/common/geo_controller.dart';
import 'package:booking/controllers/common/image_picker_controller.dart';
import 'package:booking/controllers/order/order_pending_controller.dart';
import 'package:booking/views/pages/commons/geo_page.dart';
import 'package:booking/views/pages/commons/image_picker_page.dart';
import 'package:get/get.dart';

import '../../controllers/common/tabbar_controller.dart';
import '../../controllers/user/forget_password_controller.dart';
import '../../controllers/user/register_controller.dart';
import '../../controllers/user/signin_controller.dart';
import '../../controllers/user/remove_acc_controller.dart';
import '../../controllers/order/order_create_controller.dart';
import '../../views/pages/commons/splash_page.dart';
import '../../views/pages/commons/tabbar_page.dart';
import '../../views/pages/order/order_create_page.dart';
import '../../views/pages/user/forget_password_page.dart';
import '../../views/pages/user/profile_page.dart';
import '../../views/pages/user/register_page.dart';
import '../../views/pages/user/signIn_page.dart';
import '../../views/pages/user/removeAcc_page.dart';

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
          Get.lazyPut(() => OrderPendingController());
          // Get.lazyPut(() => TabbarController());
          // Get.lazyPut(() => TabbarController());
        }),
        transition: Transition.noTransition,
        fullscreenDialog: true),
    GetPage(
        name: OrderCreatePage.path,
        page: () => const OrderCreatePage(),
        binding: BindingsBuilder(() {
          Get.lazyPut(() => OrderCreateController());
        }),
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
        })),
    GetPage(
        name: GeoPage.path,
        page: () => const GeoPage(),
        binding: BindingsBuilder(() {
          Get.lazyPut(() => GeoController());
        })),
    GetPage(
        name: ImagePickerPage.path,
        page: () => const ImagePickerPage(),
        binding: BindingsBuilder(() {
          Get.lazyPut(() => ImagePickerController());
        }),
        transition: Transition.downToUp,
        fullscreenDialog: true),
  ];
}
