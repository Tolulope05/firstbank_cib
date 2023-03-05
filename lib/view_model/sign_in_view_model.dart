import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/routes/routes_name.dart';

class SignInViewModel extends GetxController {
  TextEditingController organizationCodeController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void onClose() {
    organizationCodeController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }

// navigate to pin confirmation screen
  void navigateToPinConfirmationScreen() {
    Get.toNamed(RoutesName.pinConfirmation);
  }
}
