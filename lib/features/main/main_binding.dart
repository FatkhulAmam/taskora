import 'package:get/get.dart';
import 'package:taskora/features/home/home_logic.dart';
import 'package:taskora/features/profile/profile_logic.dart';

import 'main_logic.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainLogic>(() => MainLogic());
    Get.lazyPut<HomeLogic>(() => HomeLogic());
    Get.lazyPut<ProfileLogic>(() => ProfileLogic());
  }
}