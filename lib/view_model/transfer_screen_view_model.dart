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

  // making account dynamic
  final RxList<BankAccount> _accountList = <BankAccount>[].obs;
  List<BankAccount> get accountList => _accountList;
  final RxList<Beneficiary> _beneficiarylist = <Beneficiary>[].obs;
  List<Beneficiary> get beneficiarylist => _beneficiarylist;

  /// OWN ACCOUNT LOGICS
  final Rx<BankAccount> _selectedSourceAccount = BankAccount().obs;
  BankAccount get selectedSourceAccount => _selectedSourceAccount.value;
  final Rx<BankAccount> _selectedBeneficiaryAccount = BankAccount().obs;
  BankAccount get selectedBeneficiaryAccount =>
      _selectedBeneficiaryAccount.value;
  final RxString _selectedSourceAccounthintText = "Select Account".obs;
  String get selectedSourceAccounthintText =>
      _selectedSourceAccounthintText.value;
  final RxString _selectedBeneficiaryAccounthintText = "01234567".obs;
  String get selectedBeneficiaryAccounthintText =>
      _selectedBeneficiaryAccounthintText.value;
  //
  TextEditingController ownBankSourceAccountController =
      TextEditingController();
  TextEditingController ownBankBeneficiaryAccountController =
      TextEditingController();
  TextEditingController beneficialAmountController = TextEditingController();
  TextEditingController ownAccountPaymentMemoController =
      TextEditingController();
  final RxString _valueDate = "".obs;
  String get ownvalueDate => _valueDate.value;

// FIRST BANK TAB LOGICS
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

  final Rx<BankAccount> _selectedSourceAccountFB = BankAccount().obs;
  BankAccount get selectedSourceAccountFB => _selectedSourceAccountFB.value;
  final RxString _selectedSourceAccounthintTextFB = "Select Account".obs;
  String get selectedSourceAccounthintTextFB =>
      _selectedSourceAccounthintTextFB.value;
  final Rx<Beneficiary> _selectedbeneficiaryFB = Beneficiary().obs;
  Beneficiary get selectedbeneficiaryFB => _selectedbeneficiaryFB.value;
  final RxString _selectedBeneficiaryAccountnum = "01234567".obs;
  String get selectedBeneficiaryAccountnum =>
      _selectedBeneficiaryAccountnum.value;
  final RxString _selectedBeneficiaryName = " ".obs;
  String get selectedBeneficiaryName => _selectedBeneficiaryName.value;
  final RxString _valueDateFB = "".obs;
  String get ownvalueDateFB => _valueDate.value;

  //get account list
  selectAccountfromDialogue(int index, int selector) {
    switch (selector) {
      case 1:
        // source account
        _selectedSourceAccount.value = _accountList[index];
        _selectedSourceAccounthintText.value =
            "${_accountList[index].accountName} - ${_accountList[index].accountNumber}";
        print("${_selectedSourceAccount.value.accountNumber} selected");
        _accountList.remove(_selectedSourceAccount.value);
        _accountList.refresh();
        break;
      case 2:
        // beneficiary account
        _selectedBeneficiaryAccount.value = _accountList[index];
        _selectedBeneficiaryAccounthintText.value =
            "${_accountList[index].accountNumber}";
        print("${_selectedBeneficiaryAccount.value.accountNumber} selected");
        _accountList.refresh();
        break;

      case 3:
        _selectedSourceAccountFB.value = _accountList[index];
        _selectedSourceAccounthintTextFB.value =
            "${_accountList[index].accountName} - ${_accountList[index].accountNumber}";
        print("${_selectedSourceAccountFB.value.accountNumber} selected");
        break;

      default:
    }

    Get.back();
  }

  selectBeneficiaryFromDialogue(int index) {
    _selectedbeneficiaryFB.value = _beneficiarylist[index];
    _selectedBeneficiaryAccountnum.value =
        "${_beneficiarylist[index].accountNumber}";
    _selectedBeneficiaryName.value = "${_beneficiarylist[index].accountName}";
    Get.back();
  }

  changeDateTonow() {
    DateTime dateTime = DateTime.now();
    String result = DateFormat("yyyy/MM/dd").format(dateTime);
    print(result); // Output: 2023/03/10
    _valueDate.value = result;
    _valueDateFB.value = result;
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

  //get Date picker
  showDatePickerDialogFB() {
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
          _valueDateFB.value = result;
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
      _accountList.value = localPayResp.accounts!; // set own account list
      _beneficiarylist.value =
          localPayResp.beneficiaries!; // set FB account list
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
      sourceAccountId: selectedSourceAccountFB.accountId!.toInt(),
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
      // redirect to action center
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

  Future<void> initiateToFirstBankAccountPayment() async {
    _isAccountPaymentLoading.value = true;
    InitiatePaymentResponse initiatePaymentResponse =
        await paymentservices.initiatePayment(
      subsidiaryId: profileViewModel.subsidiaryId,
      session: "${getSession()}",
      username: "${getFullname()}@${getCorporateCode()}",
      sourceAccountId: selectedSourceAccountFB.accountId!.toInt(),
      bankCode: selectedbeneficiaryFB.bankCode ?? "011",
      amount: int.parse(firstBankAmountAccountController.text),
      charges: 0,
      paymentType: ownselectedPaymentType,
      bankName: selectedbeneficiaryFB.bankName!,
      paymentMethod: ownselectedPaymentTMethod,
      dateTime: ownvalueDateFB,
      memo: firstBankPaymentMemoController.text,
      recieverAccountNumber: selectedbeneficiaryFB.accountNumber!,
      recieverName: selectedbeneficiaryFB.accountName ?? "",
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
      // redirect to action center
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
