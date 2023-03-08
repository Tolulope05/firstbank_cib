import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../model/login_model.dart';
import '../services/auth_services.dart';
import '../utils/routes/routes_name.dart';

class SignInViewModel extends GetxController {
  final GlobalKey formKey = GlobalKey<FormState>();
  TextEditingController organizationCodeController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  AuthServices authServices = AuthServices();
  Rxn<LoginModel>? _user;
  get user => _user!.value;
  // local storage
  final box = GetStorage();

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

  // login with username and password
  Future<void> loginUser() async {
    try {
      user!.value = await authServices.loginWithUsernameAndPassword(
        username: usernameController.text,
        password: passwordController.text,
        corporateCode: organizationCodeController.text,
      );

      // save user data
      box.write('userToken', user!.value!.token);

      usernameController.clear();
      passwordController.clear();
      organizationCodeController.clear();
      Get.offAllNamed(RoutesName.homeScreen);
    } catch (error) {
      String errorMessage = error.toString();
      Get.snackbar(
        'Failed to login..',
        errorMessage,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}

 


/**
 * {
  "username": "lukushaker",
  "password": "Password10!",
  "ipAddress": "string",
  "macAddress": "string",
  "corporateCode": "testing"
}'
 */
