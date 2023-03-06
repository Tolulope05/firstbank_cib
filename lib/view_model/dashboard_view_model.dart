import 'package:firstbank_cib/utils/routes/routes_name.dart';
import 'package:get/get.dart';

class DashBoardviewModel extends GetxController {
  navigateToActionCenter() {
    Get.toNamed(RoutesName.actionCenter);
  }
}
