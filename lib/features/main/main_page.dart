import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskora/features/main/main_logic.dart';
import 'package:taskora/features/main/widget/bottom_nav_bar.dart';
import '../notif/notif_page.dart';
import '../home/home_page.dart';
import '../profile/profile_page.dart';

class MainPage extends GetView<MainLogic> {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final pages = [
      HomePage(),
      const NotifPage(),
      const ProfilePage(),
    ];

    return Scaffold(
      extendBody: true,
      body: Obx(() => IndexedStack(
        index: controller.state.currentIndex.value,
        children: pages,
      )),
      bottomNavigationBar: Obx(() => BottomNavBar(
        currentIndex: controller.state.currentIndex.value,
        onTap: controller.changeTab,
      )),
    );
  }
}