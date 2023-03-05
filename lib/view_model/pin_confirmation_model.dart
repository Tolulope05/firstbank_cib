import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/routes/routes_name.dart';

class PinConfirmationModel extends GetxController {
  final TextEditingController pinController = TextEditingController();

  // Rounded pin
  final Rx<TextEditingController> roundedPinController =
      TextEditingController().obs;
  final Rx<FocusNode> roundedPinFocusNode = FocusNode().obs;
  RxBool roundedPinshowError = false.obs;
  String passKey = '123456';

  @override
  void onClose() {
    pinController.dispose();
    roundedPinController.value.dispose();
    super.onClose();
  }

  // navigate back to signIn page
  void goToSignInPage() {
    Get.toNamed(RoutesName.signIn);
  }

// navigate to homePage
  void navigateToHomePage() {
    Get.offAllNamed(RoutesName.dashBoard);
  }
}
