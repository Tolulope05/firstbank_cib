import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/routes/routes_name.dart';

class SignInViewModel extends GetxController {
  TextEditingController organizationCodeController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

// navigate to pin confirmation screen
  void navigateToPinConfirmationScreen() {
    Get.toNamed(RoutesName.pinConfirmation);
  }
}
