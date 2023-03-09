import 'package:firstbank_cib/utils/routes/routes_name.dart';
import 'package:get/get.dart';

import '../model/model.dart';
import '../services/services.dart';

class DashBoardviewModel extends GetxController with CacheManager {
  final AccountCenterServices _accountCenterServices = AccountCenterServices();
  AccountCenter? accountcenter;
  String get username => getFullname() ?? "User";

  // currency comma regex
  RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
  String Function(Match) mathFunc = (Match match) => '${match[1]},';
  String giveCommaseparated(String str) => str.replaceAllMapped(reg, mathFunc);

  // write a logic that greet user based on time
  Rx<String> getTimeOfDay() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return "Good Morning".obs;
    } else if (hour < 17) {
      return "Good Afternoon".obs;
    } else {
      return "Good Evening".obs;
    }
  }

  String get greetings => getTimeOfDay().value;

  // get account center
  Future<void> getAccountCenter() async {
    AccountCenter accountResp = await _accountCenterServices.getAccountsPaged(
      page: 1,
      recordPerPage: 1,
      session: getSession()!,
      subsidiaryId: 2,
      username: "${getFullname()}@${getCorporateCode()}",
    );

    if (accountResp.success == true) {
      accountcenter = accountResp;
    } else {
      Get.snackbar(
        "Unable to fetch data",
        accountResp.message.toString(),
        snackPosition: SnackPosition.BOTTOM,
      ); // didnt work
    }
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