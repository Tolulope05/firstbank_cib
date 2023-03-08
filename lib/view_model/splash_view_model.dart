import 'package:firstbank_cib/utils/routes/routes_name.dart';
import 'package:firstbank_cib/view_model/auth_view_model.dart';
import 'package:get/get.dart';

import '../services/cache/cache_manager.dart';

class SplashViewmodel extends GetxController with CacheManager {
  AuthViewModel authViewModel = Get.put(AuthViewModel());

  @override
  void onInit() {
    handleStartUpLogic();
    super.onInit();
  }

  Future handleStartUpLogic() async {
    await authViewModel.checkLoginStatus();
    bool hasLoggedInUser = authViewModel.isLoggedValue;
    await Future.delayed(const Duration(seconds: 1));
    if (hasLoggedInUser == true) {
      Get.toNamed(RoutesName.homeScreen);
    } else {
      Get.toNamed(RoutesName.login);
    }
  }
}
