import 'package:firstbank_cib/utils/routes/routes_name.dart';
import 'package:get/get.dart';

import '../model/model.dart';
import '../services/services.dart';

class DashBoardviewModel extends GetxController with CacheManager {
  final AccountCenterServices _accountCenterServices = AccountCenterServices();
  AccountCenter? accountcenter;

  void getAccountCenter() async {
    accountcenter = await _accountCenterServices.getAccountsPaged(
      page: 1,
      recordPerPage: 2,
      session: getSession()!,
      subsidiaryId: 2,
      username: "${getFullname()}@${getSession()}",
    );
  }

  @override
  void onInit() {
    getAccountCenter();
    super.onInit();
  }

//navigation logics
  navigateToActionCenter() {
    Get.toNamed(RoutesName.actionCenter);
  }
}

/**
 * {
  "session": "rGz4Rf46ghUAPAd5BcOzHquu3zWj4OcG0d1n73YZN9t37WZn4IXuhQ9wopZ4QImedtRPp4x6RhbDhulPIiVaw",
  "username": "lukushaker@testing",
  "subsidiaryId": 2,
  "page": 1,
  "recordPerPage": 1
}
 */