import 'package:firstbank_cib/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../model/login_model.dart';
import '../services/auth_services.dart';
import '../utils/routes/routes_name.dart';

class SignInViewModel extends GetxController {
  TextEditingController organizationCodeController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  AuthServices authServices = AuthServices();
  Rxn<LoginModel>? _user;
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
      _user!.value = await authServices.loginWithUsernameAndPassword(
        username: usernameController.text,
        password: passwordController.text,
        corporateCode: organizationCodeController.text,
      );

      // save user data
      box.write('userToken', _user!.value!.token);
      Get.offAllNamed(RoutesName.homeScreen);
    } catch (error) {
      String errorMessage = error.toString();
      Get.snackbar(
        'Failed to login..',
        errorMessage,
        backgroundColor: AppColors.primaryColor.withOpacity(0.9),
        colorText: AppColors.whiteColor,
        snackPosition: SnackPosition.BOTTOM,
      );
      throw Exception(errorMessage);
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
