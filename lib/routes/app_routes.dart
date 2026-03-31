import 'package:get/get.dart';

import '../features/auth/login_binding.dart';
import '../features/auth/login_page.dart';
import '../features/home/home_page.dart';
import '../features/splash/splash_page.dart';

class Routes {
  static const SPLASH = '/';
  static const LOGIN = '/login';
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
    GetPage(name: Routes.HOME, page: () => HomePage(), binding: LoginBinding()),
  ];
}
