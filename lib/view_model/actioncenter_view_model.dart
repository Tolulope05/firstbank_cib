import 'package:firstbank_cib/utils/routes/routes_name.dart';
import 'package:get/get.dart';

class ActionCenterViewModel extends GetxController {
  //navigation logics
  navigateback() {
    Get.back();
  }

  navigateTotransactionDetails() {
    Get.toNamed(RoutesName.transactionDetails);
  }
}
