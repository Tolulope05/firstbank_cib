import 'package:firstbank_cib/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActionCenterModel extends GetxController {
  //navigation logics
  navigateback() {
    Get.back();
  }

  navigateTotransactionDetails() {
    Get.toNamed(RoutesName.transactionDetails);
  }
}
