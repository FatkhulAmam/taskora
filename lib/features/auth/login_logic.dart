import 'package:get/get.dart';

import 'login_state.dart';

class LoginLogic extends GetxController {
  final LoginState state = LoginState();

  void login() async {
    if (state.email.value.isEmpty || state.password.value.isEmpty) {
      Get.snackbar("Error", "Email & Password wajib diisi");
      return;
    }

    state.isLoading.value = true;

    await Future.delayed(const Duration(seconds: 2));

    state.isLoading.value = false;

    // 🚀 Navigate ke home
    Get.offAllNamed('/home');
  }
}
