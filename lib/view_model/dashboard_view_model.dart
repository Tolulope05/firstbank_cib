import 'package:firstbank_cib/utils/routes/routes_name.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../model/model.dart';
import '../services/services.dart';

class DashBoardviewModel extends GetxController with CacheManager {
// Account Center
  final AccountCenterServices _accountCenterServices = AccountCenterServices();

  final Rx<AccountCenter> _accountCenter = AccountCenter().obs;
  AccountCenter get accountcenter => _accountCenter.value;

  // Transaction History
  final Rx<TransactionHistoryResponse> _transactionHistoryResponse =
      TransactionHistoryResponse().obs;
  TransactionHistoryResponse get transactionHistoryResponse =>
      _transactionHistoryResponse.value;

  // User Details
  String get username => getFullname() ?? "User";
  RxBool obScureBalance = true.obs;
  RxBool isLoading = true.obs;

// Transaction History Date parsing
  DateTime now = DateTime.now();
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  String get presentDate => DateFormat('yyyy-MM-dd').format(now);
// Get first date of the month
  DateTime get firstDateOfMonth => DateTime(now.year, now.month, 1);
// Parse date to string
  String get firstDateOfMonthString => formatter.format(firstDateOfMonth);

  togglePasswordVisibility() {
    obScureBalance.value = !obScureBalance.value;
  }

  // currency comma regex
  RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
  String Function(Match) mathFunc = (Match match) => '${match[1]},';
  String giveCommaseparated(String str) => str.replaceAllMapped(reg, mathFunc);
  // obscure home balance
  String obscureBalance(String balance) {
    // replace all digit and string with *
    String finalBalance = balance.replaceAll(RegExp(r'[0-9,.]'), '*');
    return finalBalance;
  }

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

  @override
  void onInit() async {
    await getAccountCenter();
    await getTransactionHistory();
    super.onInit();
  }

  // get account center
  Future<void> getAccountCenter() async {
    isLoading.value = true;
    AccountCenter accountResp = await _accountCenterServices.getAccountsPaged(
      page: 0,
      recordPerPage: 10,
      session: getSession()!,
      subsidiaryId: 2,
      username: "${getFullname()}@${getCorporateCode()}",
    );

    if (accountResp.success == true) {
      _accountCenter.value = accountResp;
      isLoading.value = false;
    } else {
      Get.snackbar(
        "Unable to fetch data",
        accountResp.message.toString(),
        snackPosition: SnackPosition.BOTTOM,
      ); // didnt work
      isLoading.value = false;
    }
  }

  // get transaction history
  Future<void> getTransactionHistory() async {
    print(accountcenter.accounts![0].accountId!);
    TransactionHistoryResponse transactionResponse =
        await _accountCenterServices.getTransctionHistory(
      accountId: accountcenter.accounts![0].accountId!,
      dashboard: true,
      startDate: firstDateOfMonthString,
      enddate: presentDate,
      session: getSession()!,
      username: "${getFullname()}@${getCorporateCode()}",
    );
    if (transactionResponse.success == true) {
      _transactionHistoryResponse.value = transactionResponse;
    } else {
      Get.snackbar(
        "Unable to fetch history",
        transactionResponse.responseMessage.toString(),
        snackPosition: SnackPosition.BOTTOM,
      ); // didnt work
    }
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
