import 'package:firstbank_cib/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../model/login_model.dart';
import '../services/auth_services.dart';
import '../utils/routes/routes_name.dart';

class AuthViewModel extends GetxController {
  TextEditingController organizationCodeController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  AuthServices authServices = AuthServices();
  LoginResponse? userResponse;
  // Rx<bool> isLoading = false.obs;

  final Rx<bool> isLogged = false.obs;

  // local storage
  final box = GetStorage();

  @override
  void onClose() {
    organizationCodeController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void checkLoginStatus() {
    if (box.read('userToken') != null) {
      Get.offAllNamed(RoutesName.homeScreen);
    }
  }

// navigate to pin confirmation screen
  void navigateToPinConfirmationScreen() {
    Get.toNamed(RoutesName.pinConfirmation);
  } // not used yet in the api

  // login with username and password
  Future<void> loginUser() async {
    try {
      userResponse = await authServices.loginWithUsernameAndPassword(
        username: usernameController.text,
        password: passwordController.text,
        corporateCode: organizationCodeController.text,
      );
      // save user data
      if (userResponse != null) {
        box.write('userToken', userResponse!.token);
        box.write('userSession', userResponse!.session);
      }

      if (userResponse!.success == false) {
        Utils.getsnackbar(
          title: "Not Succesful",
          message: userResponse!.responseMessage,
        );
      } else {
        Utils.getsnackbar(
          title: "Welcome ${userResponse!.fullname} ",
          message: userResponse!.responseMessage,
        );
        Get.offAllNamed(RoutesName.homeScreen);
      }
    } catch (error) {
      String errorMessage = error.toString();
      Utils.getsnackbar(title: "Failed to login..", message: errorMessage);
      throw Exception(errorMessage);
    }
  }
}

 


/**
  "username": "lukushaker",
  "password": "Password10!",
  "ipAddress": "string",
  "macAddress": "string",
  "corporateCode": "testing" //Organization Code
 */
