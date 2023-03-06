import 'package:firstbank_cib/utils/routes/routes_name.dart';
import 'package:get/get.dart';

class ActionCenterModel extends GetxController {
  navigateback() {
    Get.back();
  }

  navigateTotransactionDetails() {
    Get.toNamed(RoutesName.transactionDetails);
  }
}
