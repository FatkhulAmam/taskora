import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../themes/colors.dart';
import '../../themes/style.dart';
import '../../utils/base_page.dart';
import 'login_logic.dart';
import 'login_state.dart';

class LoginPage extends BasePage<LoginLogic> {
  const LoginPage({super.key});

  @override
  String get title => "Login";

  @override
  bool get useAppBar => false;

  @override
  bool get safeArea => false;

  @override
  SystemUiOverlayStyle get overlayStyle => const SystemUiOverlayStyle(
    statusBarColor: AppColors.primary,
    statusBarIconBrightness: Brightness.light,
  );

  @override
  Widget buildBody(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primary,
            AppColors.background,
            AppColors.background,
            AppColors.background,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: SafeArea(
        child: Stack(
          children: [
            SafeArea(child: _buildContent(context)),
            _buildButton(context),
          ],
        ),
      ),
    );
  }

  @override
  Widget buildLoading() {
    return Obx(() {
      if (!controller.state.isLoading.value) return const SizedBox();

      return Container(
        color: Colors.black.withOpacity(0.3),
        child: const Center(
          child: CircularProgressIndicator(color: AppColors.primary),
        ),
      );
    });
  }

  Widget _buildContent(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 75),
      child: Column(
        children: [
          SizedBox(height: 75),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/splash_icon.png', width: 90),
              const SizedBox(height: 16),
              Text(
                "TASKORA",
                style: AppStyle.h1.copyWith(
                  color: AppColors.primaryDark,
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                "TASK • OPERATION RISK ANALYTIC",
                style: AppStyle.h3.copyWith(
                  fontSize: 14,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),

          SizedBox(height: 50),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Selamat Datang!',
                  style: AppStyle.h1.copyWith(
                    fontSize: 18,
                    color: AppColors.textBlack,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Masuk ke akun TASKORA-mu',
                  style: AppStyle.h4.copyWith(
                    fontSize: 14,
                    color: AppColors.textSecondary,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  'Email',
                  style: AppStyle.h2.copyWith(
                    fontSize: 14,
                    color: AppColors.textBlack,
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  onChanged: (val) => controller.state.email.value = val,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.email_outlined),
                    labelStyle: AppStyle.body,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide(color: AppColors.primary),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Password',
                  style: AppStyle.h2.copyWith(
                    fontSize: 14,
                    color: AppColors.textBlack,
                  ),
                ),
                SizedBox(height: 10),
                Obx(() {
                  return TextField(
                    obscureText: !controller.state.isObscure.value,
                    onChanged: (val) => controller.state.password.value = val,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock_outline),
                      suffixIcon: IconButton(
                        icon: Icon(
                          controller.state.isObscure.isTrue
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: () {
                          controller.state.isObscure.toggle();
                        },
                      ),
                      labelStyle: AppStyle.body,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide(color: AppColors.primary),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(BuildContext context) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeOut,
      left: 25,
      right: 25,
      bottom: 0,
      child: Obx(
        () => SizedBox(
          height: 50,
          child: ElevatedButton(
            onPressed: controller.state.isLoading.value
                ? null
                : controller.login,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: controller.state.isLoading.value
                ? const CircularProgressIndicator(color: AppColors.grey)
                : Text("Masuk", style: AppStyle.button),
          ),
        ),
      ),
    );
  }
}
