import 'package:firstbank_cib/view_model/login_view_model.dart';
import 'package:get/get.dart';

import '../view_model/sign_in_view_model.dart';
import '../view_model/splash_view_model.dart';

class InitialBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(SplashViewmodel());
    Get.put(SignInViewModel(), permanent: true);
    Get.lazyPut(() => LoginViewModel());
  }
}
