import 'package:firstbank_cib/constants/colors.dart';
import 'package:firstbank_cib/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/login_response.dart';
import '../model/logout_response.dart';
import '../services/services.dart';
import '../utils/routes/routes_name.dart';

class AuthViewModel extends GetxController with CacheManager {
  TextEditingController organizationCodeController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  AuthServices authServices = AuthServices();
  final Rx<LoginResponse> _userResponse = LoginResponse().obs;
  LoginResponse? get userResponse => _userResponse.value;

  final RxList<GetSubsidiary?> _subsidiariesList = <GetSubsidiary>[].obs;
  List<GetSubsidiary?> get subsidiariesList => _subsidiariesList;

  Rx<bool> isLoading = false.obs;

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
    isLoading.value = true;
    try {
      LoginResponse resFromServer =
          await authServices.loginWithUsernameAndPassword(
        username: usernameController.text.trim(),
        password: passwordController.text.trim(),
        corporateCode: organizationCodeController.text.trim(),
      );

      if (resFromServer.success == true) {
        _userResponse.value = resFromServer;
        _isLogged.value = true;
        //Token and session is cached
        await saveToken(_userResponse.value.token);
        await saveSession(_userResponse.value.session);
        await saveFullname(usernameController.text.trim());
        await saveCorporateCode(organizationCodeController.text.trim());
        // _userResponse.value.getSubsidiaries!.map((element) {
        //   subsidiariesList.add(element);
        // });
        _subsidiariesList.addAll(_userResponse.value.getSubsidiaries!);
        // navigate to home screen
        usernameController.clear();
        passwordController.clear();
        organizationCodeController.clear();
        isLoading.value = false;
        Get.offAllNamed(RoutesName.homeScreen);
        Utils.getsnackbar(
          title: "Welcome ${getFullname()} ",
          // title: "Welcome ${userResponse!.fullname} ",
          message: resFromServer.responseMessage ?? "Successfully logged in",
        );
      } else {
        _isLogged.value = false;
        await saveToken(_userResponse.value.token);
        await saveSession(_userResponse.value.session);

        Utils.getsnackbar(
          title: "Not Succesful",
          message: resFromServer.responseMessage ?? "Failed to login",
        );
      }
    } catch (error) {
      String errorMessage = error.toString();
      Utils.getsnackbar(title: "Failed to login..", message: errorMessage);
      throw Exception(errorMessage);
    }
    isLoading.value = false;
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
              logOut();
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
  void logOut() async {
    _isLogged.value = false;
    LogoutResponse logoutResp = await authServices.logoutUser(
      username: "${getFullname()}@${getCorporateCode()}",
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
