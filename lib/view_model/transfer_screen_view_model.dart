import 'package:firstbank_cib/services/services.dart';
import 'package:firstbank_cib/view/dashboard/action_center_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/payment_type_response.dart';
import '../services/payment_services.dart';
import 'view_model.dart';

class TransferScreenViewModel extends GetxController with CacheManager {
//Auth services callback
  AuthViewModel authViewModel = Get.find<AuthViewModel>();

// firstbank account number
  TextEditingController firstBankSourceAccountController =
      TextEditingController();
  TextEditingController firstBankBeneficialAccountController =
      TextEditingController();
  TextEditingController firstBankBeneficialAccountnameController =
      TextEditingController();
  TextEditingController firstBankPaymentTypeController =
      TextEditingController();
  TextEditingController firstBankAmountAccountController =
      TextEditingController();
  TextEditingController firstBankPaymentMemoController =
      TextEditingController();
  final RxBool _saveBeneficiary = false.obs;
  bool get saveBeneficiary => _saveBeneficiary.value;
  void saveBeneficiaryToggle() {
    _saveBeneficiary.value = !_saveBeneficiary.value;
  }

  // other account number
  TextEditingController otherBankSourceAccountController =
      TextEditingController();
  TextEditingController otherBankBeneficialAccountController =
      TextEditingController();
  TextEditingController otherBankBeneficialAccountnameController =
      TextEditingController();
  TextEditingController otherBankPaymentTypeController =
      TextEditingController();
  TextEditingController otherBankAmountAccountController =
      TextEditingController();
  TextEditingController otherBankPaymentMemoController =
      TextEditingController();
  // firstbank account number
  TextEditingController internationalBankSourceAccountController =
      TextEditingController();
  TextEditingController internationalBankBeneficialAccountController =
      TextEditingController();
  TextEditingController internationalBankBeneficialAccountnameController =
      TextEditingController();
  TextEditingController internationalBankPaymentTypeController =
      TextEditingController();
  TextEditingController internationalBankAmountAccountController =
      TextEditingController();
  TextEditingController internationalBankPaymentMemoController =
      TextEditingController();

  Paymentservices paymentservices = Paymentservices();
  // local payment servie call
  final Rx<LocalPaymentResponse> _localPaymentResponse =
      LocalPaymentResponse().obs;
  LocalPaymentResponse get localPaymentResponse => _localPaymentResponse.value;
  List<BankAccount> accountList = [];
  List<BankAccount> beneficiaryList = [];

  /// OWN ACCOUNT LOGICS
  // select source by account number
  final Rx<BankAccount> _selectedSourceAccount = BankAccount().obs;
  BankAccount get selectedSourceAccount => _selectedSourceAccount.value;
  final Rx<BankAccount> _selectedBeneficiaryAccount = BankAccount().obs;
  BankAccount get selectedBeneficiaryAccount =>
      _selectedBeneficiaryAccount.value;
  // select source by Bank account
  setSourceAccount(BankAccount bankAccount) {
    _selectedSourceAccount.value = bankAccount;
    print("${_selectedSourceAccount.value.accountName} selected");
  }

  setBeneficiaryAccount(BankAccount bankAccount) {
    _selectedBeneficiaryAccount.value = bankAccount;
    print("${_selectedBeneficiaryAccount.value.accountNumber} selected");
  }

  TextEditingController beneficialAmountController = TextEditingController();
  TextEditingController ownAccountPaymentMemoController =
      TextEditingController();

  @override
  void onInit() async {
    super.onInit();
    await getLocalPayment();
  }

  // get source bank list
  Future<List<BankAccount>> getSourceBankList() async {
    List<BankAccount> sourceBankList = [];
    for (var i = 0; i < accountList.length; i++) {
      sourceBankList.add(accountList[i]);
    }
    return sourceBankList;
  }

  // get beneficiary bank list
  Future<List<BankAccount>> getBeneficiaryBankList() async {
    List<BankAccount> beneficiaryBankList = [];
    for (var i = 0; i < beneficiaryList.length; i++) {
      beneficiaryBankList.add(beneficiaryList[i]);
    }
    return beneficiaryBankList;
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
      beneficiaryList = localPayResp.accounts!;
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

  // call initiate payment
  Future<void> initiateOwnAccountPayment() async {
    InitiatePaymentResponse initiatePaymentResponse =
        await paymentservices.initiatePayment(
      session: "${getSession()}",
      username: "${getFullname()}@${getCorporateCode()}",
      sourceAccountId: selectedSourceAccount.accountId!,
      bankCode: selectedBeneficiaryAccount.bankCode ?? "011",
      amount: int.parse(beneficialAmountController.text),
      charges: 0,
      bankName: selectedBeneficiaryAccount.bankName!,
      dateTime: "2023-03-10",
      memo: ownAccountPaymentMemoController.text,
      recieverAccountNumber: selectedBeneficiaryAccount.accountNumber!,
      recieverName: selectedBeneficiaryAccount.preferredName!,
      saveBeneficiary: saveBeneficiary,
    );
    if (initiatePaymentResponse.success == true) {
      Get.snackbar(
        "Success",
        initiatePaymentResponse.responseMessage.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      Get.to(() => const ActionCenterScreen());
    } else {
      Get.snackbar(
        "Something went wrong",
        initiatePaymentResponse.responseMessage.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  /**  DateTime now = DateTime.now();
  String formattedDate = DateFormat('yyyy-MM-dd').format(now.add(Duration(days: 1148)));
  print(formattedDate); // Output: "2023-03-10" */
}
