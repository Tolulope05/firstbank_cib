import 'package:get/get.dart';

import '../view_model/view_model.dart';

class AuthBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginViewModel());
    Get.lazyPut(() => PinConfirmationModel());
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => PinConfirmationModel());
  }
}
