import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransferScreenViewModel extends GetxController {
// own account number
  TextEditingController sourceAccountController = TextEditingController();
  TextEditingController beneficialAccountController = TextEditingController();
  TextEditingController amountAccountController = TextEditingController();
// firstbank account number
  TextEditingController firstBankAccountController = TextEditingController();
  TextEditingController firstBankBeneficialAccountController =
      TextEditingController();
  TextEditingController firstBankAmountAccountController =
      TextEditingController();
}
