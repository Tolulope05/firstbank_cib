import 'package:firstbank_cib/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/payment_type_response.dart';
import '../services/payment_services.dart';

class TransferScreenViewModel extends GetxController with CacheManager {
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

  // local payment servie call
  final Rx<LocalPaymentResponse> _localPaymentResponse =
      LocalPaymentResponse().obs;
  LocalPaymentResponse get localPaymentResponse => _localPaymentResponse.value;

  Paymentservices paymentservices = Paymentservices();

  @override
  void onInit() async {
    super.onInit();
    await getLocalPayment();
  }

  //call get local payment
  Future<void> getLocalPayment() async {
    LocalPaymentResponse localPayResp = await paymentservices.getLocalPayment(
      session: "session",
      username: "${getFullname()}@${getCorporateCode()}",
      subsidiaryId: 2,
    );
    if (localPayResp.success == true) {
      _localPaymentResponse.value = localPayResp;
    } else {
      Get.snackbar(
        "Unable to fetch data",
        localPayResp.message.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
