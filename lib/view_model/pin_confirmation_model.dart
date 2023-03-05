import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/routes/routes_name.dart';

class PinConfirmationModel extends GetxController {
  final TextEditingController pinController = TextEditingController();
  // navigate back to signIn page
  void goToSignInPage() {
    Get.toNamed(RoutesName.signIn);
  }

// navigate to homePage
  void navigateToHomePage() {
    Get.toNamed(RoutesName.homePage);
  }
}
