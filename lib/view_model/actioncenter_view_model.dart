import 'dart:math';

import 'package:firstbank_cib/constants/colors.dart';
import 'package:firstbank_cib/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/model.dart';
import '../services/services.dart';
import 'view_model.dart';

class ActionCenterViewModel extends GetxController with CacheManager {
  Paymentservices paymentservices = Paymentservices();
  ProfileViewModel profileViewModel = Get.put(ProfileViewModel());

  // local payment servie call
  final Rx<SinglePaymentResponse> _localPaymentResponse =
      SinglePaymentResponse().obs;
  SinglePaymentResponse get localPaymentResponse => _localPaymentResponse.value;

  final Rx<Paymentt> _paymentDetails = Paymentt().obs;
  Paymentt get paymentDetails => _paymentDetails.value;

  selectPayment(int payment) {
    _paymentDetails.value = localPaymentResponse.payments![payment];

    Get.toNamed(
      RoutesName.transactionDetails,
    );
  }

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

  // generate 8 random int
  int generateRandomInt() {
    var rng = Random();
    int rngInt = rng.nextInt(100000000);
    print(rngInt);
    return rngInt;
  }

  approvePayment({
    required String? batchID,
    required int paymentId,
    required bool approve,
  }) async {
    generateRandomInt();
    ApprovePaymentResponse approvalResp = await paymentservices.approvePayment(
      session: "${getSession()}",
      username: "${getFullname()}@${getCorporateCode()}",
      approve: approve,
      paymentId: paymentId,
      subsidiaryId: profileViewModel.subsidiaryId,
      batchId: batchID,
      token: "45594039",
    );

    if (approvalResp.success == true) {
      Get.snackbar(
        "Success",
        "payment approved",
        colorText: Colors.white,
        backgroundColor: AppColors.primaryColorDeep,
      );
      Get.offAndToNamed(RoutesName.homeScreen);
    } else {
      Get.snackbar(
        "Something went",
        "payment not approved",
        colorText: Colors.white,
        backgroundColor: AppColors.primaryColorDeep,
      );
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
}
