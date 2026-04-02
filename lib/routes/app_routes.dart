import 'package:get/get.dart';
import 'package:taskora/features/home/home_binding.dart';
import 'package:taskora/features/main/main_binding.dart';
import 'package:taskora/features/main/main_page.dart';

import '../features/auth/login_binding.dart';
import '../features/auth/login_page.dart';
import '../features/home/home_page.dart';
import '../features/splash/splash_page.dart';

class Routes {
  static const SPLASH = '/';
  static const LOGIN = '/login';
  static const MAIN = '/main';
  static const HOME = '/home';
}

class AppPages {
  static final pages = [
    GetPage(name: Routes.SPLASH, page: () => SplashPage()),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.MAIN,
      page: () => MainPage(),
      binding: MainBinding(),
    ),
    GetPage(name: Routes.HOME, page: () => HomePage(), binding: HomeBinding()),
  ];
}
