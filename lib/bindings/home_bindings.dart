import 'package:get/get.dart';

import '../view_model/view_model.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeViewModel());
    Get.put(DashBoardviewModel());
    Get.put(TransferScreenViewModel());
    Get.put(ActionCenterViewModel());
    Get.put(ProfileViewModel());
  }
}
