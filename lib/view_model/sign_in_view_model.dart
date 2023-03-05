import 'package:get/get.dart';

import '../utils/routes/routes_name.dart';

class SignInViewModel extends GetxController {
// navigate to pin confirmation screen
  void navigateToPinConfirmationScreen() {
    Get.toNamed(RoutesName.pinConfirmation);
  }
}
