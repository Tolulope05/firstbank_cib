import 'package:get/get.dart';

import '../view_model/view_model.dart';

class SplashBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(SplashViewmodel());
  }
}
