import 'package:firstbank_cib/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/payment_type_response.dart';
import '../services/payment_services.dart';
import 'view_model.dart';

class TransferScreenViewModel extends GetxController with CacheManager {
//Auth services callback
  AuthViewModel authViewModel = Get.find<AuthViewModel>();
// own account number
  TextEditingController sourceAccountController = TextEditingController();
  TextEditingController beneficialAccountController = TextEditingController();
  TextEditingController amountAccountController = TextEditingController();
// firstbank account number
  TextEditingController firstBankAccountController = TextEditingController();
  TextEditingController firstBankBeneficialAccountController =
      TextEditingController();
  TextEditingController firstBankBeneficialAccountnameController =
      TextEditingController();
  TextEditingController firstBankPaymentTypeController =
      TextEditingController();
  TextEditingController firstBankAmountAccountControllerMemo =
      TextEditingController();

  Paymentservices paymentservices = Paymentservices();
  // local payment servie call
  final Rx<LocalPaymentResponse> _localPaymentResponse =
      LocalPaymentResponse().obs;
  LocalPaymentResponse get localPaymentResponse => _localPaymentResponse.value;
  List<BankAccount> accountList = [];

  // select account list search by account number
  final Rx<BankAccount> _selectedAccount = BankAccount().obs;
  BankAccount get selectedAccount => _selectedAccount.value;
  // select account list search by account name
  // Future<BankAccount> getAccountByAccountName(String accountName) async {
  //   BankAccount account = BankAccount();
  //   for (var item in accountList) {
  //     if (item.accountName == accountName) {
  //       account = item;
  //     }
  //   }
  //   return account;
  // }
  // select account from a list of account where account number is the same
  Future<BankAccount> getAccountByAccountNumber(String accountNumber) async {
    BankAccount account = BankAccount();
    for (var item in accountList) {
      if (item.accountNumber == accountNumber) {
        account = item;
      }
    }
    return account;
  }

  @override
  void onInit() async {
    super.onInit();
    await getLocalPayment();
  }

  //call get local payment
  Future<void> getLocalPayment() async {
    LocalPaymentResponse localPayResp = await paymentservices.getLocalPayment(
      session: "${getSession()}",
      username: "${getFullname()}@${getCorporateCode()}",
      subsidiaryId: 2,
    );
    if (localPayResp.success == true) {
      _localPaymentResponse.value = localPayResp;
      accountList = localPayResp.accounts!;
    } else {
      Get.snackbar(
        "Error",
        localPayResp.responseMessage.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      // logout user automatically
      authViewModel.logOut();
    }
  }
}
