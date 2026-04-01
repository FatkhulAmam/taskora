import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../themes/colors.dart';
import '../../themes/style.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Get.offAllNamed('/login');
    });

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/splash_icon.png', width: 120),
              const SizedBox(height: 24),
              Text(
                "TASKORA",
                style: AppStyle.h1.copyWith(
                  color: AppColors.textWhite,
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "TASK • OPERATION RISK ANALYTIC",
                style: AppStyle.caption.copyWith(
                  color: AppColors.textWhite.withOpacity(0.8),
                  letterSpacing: 1.2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
