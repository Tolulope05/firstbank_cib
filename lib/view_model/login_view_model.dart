import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/routes/routes_name.dart';

class LoginViewModel extends GetxController {
  final PageController pageController = PageController();

  // Go to signIn page
  void goToSignInPage() {
    Get.toNamed(RoutesName.signIn);
  }
}
