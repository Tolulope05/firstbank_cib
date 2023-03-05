import 'package:firstbank_cib/utils/routes/routes_name.dart';
import 'package:get/get.dart';

class SplashViewmodel extends GetxController {
  @override
  void onInit() {
    handleStartUpLogic();
    super.onInit();
  }

  Future handleStartUpLogic() async {
    var hasLoggedInUser = false;
    await Future.delayed(const Duration(seconds: 1));
    if (hasLoggedInUser == true) {
      Get.toNamed(RoutesName.home);
    } else {
      Get.toNamed(RoutesName.login);
    }
  }
}
