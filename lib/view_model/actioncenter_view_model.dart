import 'package:firstbank_cib/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/model.dart';
import '../services/services.dart';

class ActionCenterViewModel extends GetxController with CacheManager {
  Paymentservices paymentservices = Paymentservices();

  // local payment servie call
  final Rx<SinglePaymentResponse> _localPaymentResponse =
      SinglePaymentResponse().obs;
  SinglePaymentResponse get localPaymentResponse => _localPaymentResponse.value;

  @override
  void onInit() async {
    loadSinglePaymentResp();
    super.onInit();
  }

  loadSinglePaymentResp() async {
    SinglePaymentResponse paymentRes =
        await paymentservices.getSinglePaymentResp(
      session: "${getSession()}",
      username: "${getFullname()}@${getCorporateCode()}",
      subsidiaryId: 2,
      reportPage: false,
    );

    if (paymentRes.success == true) {
      _localPaymentResponse.value = paymentRes;
    } else {
      print("error");

      Get.dialog(AlertDialog(
        title: const Text("Opps! Something went wrong"),
        content: Text(paymentRes.responseMessage.toString()),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text("Ok"),
          ),
        ],
      ));
    }
  }

  // account balance service call

  final Rx<double> _accountBalance = 0.00.obs;
  double get accountBalance => _accountBalance.value;

  Future<double> loadAccountBalance(String accountNum) async {
    // ValidateAccountResponse paymentRes =
    //     await paymentservices.getAccountNumberStatus(
    //   session: "${getSession()}",
    //   destinationAccount: "${getFullname()}@${getCorporateCode()}",
    //   subsidiaryId: 2,
    // );
    // _accountBalance.value = paymentRes.; // THE VALIDATE ACCOUNT RESPONSE DOESNT HAVE ACCOUNT BALLANCE
    await Future.delayed(const Duration(seconds: 2));
    _accountBalance.value = localPaymentResponse.accounts!
        .firstWhere((number) => number.accountNumber == accountNum)
        .availableBalance as double;
    return _accountBalance.value;
  }

  //navigation logics
  navigateback() {
    Get.back();
  }

  void navigateTotransactionDetails(Paymentt? paymentt) {
    Get.toNamed(
      RoutesName.transactionDetails,
      arguments: paymentt,
    );
  }
}
