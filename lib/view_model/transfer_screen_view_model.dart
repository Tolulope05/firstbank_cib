import 'package:firstbank_cib/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../model/payment_type_response.dart';
import '../utils/routes/routes_name.dart';
import 'view_model.dart';

class TransferScreenViewModel extends GetxController with CacheManager {
//Auth services callback
  AuthViewModel authViewModel = Get.find<AuthViewModel>();
  // profile dynamic subsidiary id
  ProfileViewModel profileViewModel = Get.put(ProfileViewModel());

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

  // making account dynamic
  final RxList<BankAccount> _accountList = <BankAccount>[].obs;
  List<BankAccount> get accountList => _accountList;

  /// OWN ACCOUNT LOGICS
  // select source by account number
  final Rx<BankAccount> _selectedSourceAccount = BankAccount().obs;
  BankAccount get selectedSourceAccount => _selectedSourceAccount.value;
  final Rx<BankAccount> _selectedBeneficiaryAccount = BankAccount().obs;
  BankAccount get selectedBeneficiaryAccount =>
      _selectedBeneficiaryAccount.value;

  // get source bank list
  Future<List<BankAccount>> getSourceBankList() async {
    return accountList;
  }

  // get beneficiary bank list
  Future<List<BankAccount>> getBeneficiaryBankList() async {
    return accountList;
  }

  // select source by Bank account
  setSourceAccount(BankAccount bankAccount) {
    _selectedSourceAccount.value = bankAccount;
    // remvove the element from the list
    accountList.remove(bankAccount);
    print("${_selectedSourceAccount.value.accountName} selected");
  }

  setBeneficiaryAccount(BankAccount bankAccount) {
    _selectedBeneficiaryAccount.value = bankAccount;
    print("${_selectedBeneficiaryAccount.value.accountNumber} selected");
  }

  TextEditingController beneficialAmountController = TextEditingController();
  TextEditingController ownAccountPaymentMemoController =
      TextEditingController();
  final RxString _valueDate = "".obs;
  String get ownvalueDate => _valueDate.value;

  changeDateTonow() {
    DateTime dateTime = DateTime.now();
    String result = DateFormat("yyyy/MM/dd").format(dateTime);
    print(result); // Output: 2023/03/10
    _valueDate.value = result;
  }

  final Rx<int> _ownselectedPaymentType = 0.obs;
  int get ownselectedPaymentType => _ownselectedPaymentType.value;

  setOwnPaymentType(int? index) {
    _ownselectedPaymentType.value = index ?? 0;
    print("${_ownselectedPaymentType.value} selected");
  }

  final Rx<int> _ownselectedPaymentMethod = 0.obs;
  int get ownselectedPaymentTMethod => _ownselectedPaymentMethod.value;

  setOwnPaymentMethod(int? index) {
    _ownselectedPaymentMethod.value = index ?? 0;
    print("${_ownselectedPaymentMethod.value} selected");
  }

  //get Date picker
  showDatePickerDialog() {
    showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 100),
    ).then(
      (value) {
        if (value != null) {
          // print(value);
          DateTime dateTime = DateTime.parse(value.toString());
          String result = DateFormat("yyyy/MM/dd").format(dateTime);
          print(result); // Output: 2023/03/10
          _valueDate.value = result;
        }
      },
    );
  }

  @override
  void onInit() async {
    super.onInit();
    changeDateTonow();
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
      _accountList.value = localPayResp.accounts!;
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

  final RxBool _isAccountPaymentLoading = false.obs;
  bool get isAccountPaymentLoading => _isAccountPaymentLoading.value;

  // call initiate payment now
  Future<void> initiateOwnAccountPayment() async {
    _isAccountPaymentLoading.value = true;
    InitiatePaymentResponse initiatePaymentResponse =
        await paymentservices.initiatePayment(
      subsidiaryId: profileViewModel.subsidiaryId,
      session: "${getSession()}",
      username: "${getFullname()}@${getCorporateCode()}",
      sourceAccountId: selectedSourceAccount.accountId!.toInt(),
      bankCode: selectedBeneficiaryAccount.bankCode ?? "011",
      amount: int.parse(beneficialAmountController.text),
      charges: 0,
      paymentType: ownselectedPaymentType,
      bankName: selectedBeneficiaryAccount.bankName!,
      paymentMethod: ownselectedPaymentTMethod,
      dateTime: ownvalueDate,
      memo: ownAccountPaymentMemoController.text,
      recieverAccountNumber: selectedBeneficiaryAccount.accountNumber!,
      recieverName: selectedBeneficiaryAccount.preferredName ?? "",
      saveBeneficiary: saveBeneficiary,
    );
    if (initiatePaymentResponse.success == true) {
      _isAccountPaymentLoading.value = false;
      Get.snackbar(
        "Success",
        initiatePaymentResponse.responseMessage.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      // Get.to(
      //   () => const ActionCenterScreen(),
      //   binding: BindingsBuilder.put(
      //     () => ActionCenterViewModel(),
      //   ),
      // );
      Get.offAndToNamed(RoutesName.actionCenter);
    } else {
      _isAccountPaymentLoading.value = false;
      Get.snackbar(
        "Something went wrong",
        initiatePaymentResponse.responseMessage.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
