import 'package:firstbank_cib/constants/colors.dart';
import 'package:firstbank_cib/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/login_response.dart';
import '../model/logout_response.dart';
import '../services/auth_services.dart';
import '../services/cache/cache_manager.dart';
import '../utils/routes/routes_name.dart';

class AuthViewModel extends GetxController with CacheManager {
  TextEditingController organizationCodeController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  AuthServices authServices = AuthServices();
  LoginResponse? userResponse;
  List<GetSubsidiary?> subsidiariesList = <GetSubsidiary?>[];

  // Rx<bool> isLoading = false.obs;

  final Rx<bool> _isLogged = false.obs;
  bool get isLoggedValue => _isLogged.value;

  @override
  void onClose() {
    organizationCodeController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  Future<void> checkLoginStatus() async {
    final token = getToken();
    final session = getSession();
    if (token != null && session != null) {
      _isLogged.value = true;
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
      print(getSession());

      if (userResponse!.success == true) {
        _isLogged.value = true;
        //Token and session is cached
        await saveToken(userResponse!.token);
        await saveSession(userResponse!.session);
        await saveFullname(userResponse!.fullname);
        await saveCorporateCode(organizationCodeController.text);
        userResponse!.getSubsidiaries!.map((element) {
          subsidiariesList.add(element);
        });
        // navigate to home screen
        usernameController.clear();
        passwordController.clear();
        organizationCodeController.clear();

        Get.offAllNamed(RoutesName.homeScreen);
        Utils.getsnackbar(
          title: "Welcome ${getFullname()} ",
          // title: "Welcome ${userResponse!.fullname} ",
          message: userResponse!.responseMessage,
        );
      } else {
        Utils.getsnackbar(
          title: "Not Succesful",
          message: userResponse!.responseMessage,
        );
      }
    } catch (error) {
      String errorMessage = error.toString();
      Utils.getsnackbar(title: "Failed to login..", message: errorMessage);
      throw Exception(errorMessage);
    }
  }

  void logUserOut() {
    Get.dialog(
      AlertDialog(
        title: const Text(
          "Logout",
          style: TextStyle(color: AppColors.failedColor),
        ),
        content: const Text("Are you sure you want to logout?"),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text(
              "No",
              style: TextStyle(
                color: AppColors.blackColor,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              _logOut();
            },
            child: const Text(
              "Yes",
              style: TextStyle(
                color: AppColors.failedColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // logout
  void _logOut() async {
    _isLogged.value = false;
    LogoutResponse logoutResp = await authServices.logoutUser(
      username: "${getFullname()!}@${getCorporateCode()!}",
      session: getSession()!,
    );
    if (logoutResp.success == true) {
      removeToken();
      removeSession();
      removeFullname();
      removeCorporateCode();
      Get.offAllNamed(RoutesName.login);
      Utils.getsnackbar(
        title: "Logout Successfull",
        message: logoutResp.responseMessage,
      );
    } else {
      Utils.getsnackbar(
        title: "Not Succesful",
        message: logoutResp.responseMessage,
      );
    }
  }
}

 


/**
  "username": "lukushaker", or "codyrhodes"
  "password": "Password10!",
  "ipAddress": "string",
  "macAddress": "string",
  "corporateCode": "testing" //Organization Code
 */
