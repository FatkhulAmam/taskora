import 'package:get/get.dart';

class LoginState {
  LoginState() {
    ///Initialize variables
  }

  var email = ''.obs;
  var password = ''.obs;
  var isLoading = false.obs;

  RxBool isObscure = false.obs;
}
