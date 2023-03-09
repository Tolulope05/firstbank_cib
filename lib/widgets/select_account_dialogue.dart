import 'package:firstbank_cib/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/account_center.dart';

class SelectAccountDialogue extends StatelessWidget {
  SelectAccountDialogue({Key? key, required this.accounts}) : super(key: key);
  List<Account> accounts;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                bottom: 24,
              ),
              child: Row(
                children: [
                  const Text(
                    "Select Account",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.blackColor,
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: const Icon(Icons.close),
                  )
                ],
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: accounts.length,
              itemBuilder: (context, index) {
                return accountTypeWidget(
                  accountNumber: accounts[index].accountNumber,
                  accounType: accounts[index].accountType,
                  balance: accounts[index].availableBalance.toString(),
                  isNaira: accounts[index].currency == "NGN" ? true : false,
                );
              },
            ),
            // accountTypeWidget(
            //   accountNumber: "0827483028",
            //   accounType: "Current account",
            //   balance: "12,000,481",
            //   isNaira: true,
            // ),
            // accountTypeWidget(
            //   accountNumber: "0245728123",
            //   accounType: "Float account",
            //   balance: "2,000,481",
            //   isNaira: true,
            // ),
            // accountTypeWidget(
            //   accountNumber: "0948029281",
            //   accounType: "Utility account",
            //   balance: "2,000,481",
            //   isNaira: true,
            // ),
            // accountTypeWidget(
            //   accountNumber: "0827483028",
            //   accounType: "Payroll account",
            //   balance: "3,000,481",
            //   isNaira: true,
            // ),
            // accountTypeWidget(
            //   accountNumber: "0245728123",
            //   accounType: "Dollar account",
            //   balance: "23,021",
            //   isNaira: false,
            // ),
            // accountTypeWidget(
            //   accountNumber: "0827483028",
            //   accounType: "Dollar Card ccount",
            //   balance: "5,481",
            //   isNaira: false,
            // )
          ],
        ),
      ),
    );
  }
}

Widget accountTypeWidget({
  required String accountNumber,
  required String accounType,
  required String balance,
  bool isNaira = true,
}) {
  return Container(
    padding: const EdgeInsets.symmetric(
      vertical: 14,
      horizontal: 16,
    ),
    margin: const EdgeInsets.only(bottom: 8),
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          spreadRadius: 0.5,
          blurRadius: 1,
          offset: const Offset(1, 1),
        ),
      ],
      color: AppColors.whiteColor2,
    ),
    child: Row(
      children: [
        Center(
          child: Image.asset(
            isNaira ? "assets/images/naira.png" : "assets/images/dollar.png",
            width: 32,
            height: 32,
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  accountNumber,
                  style: const TextStyle(
                    color: AppColors.primaryColor,
                  ),
                ),
                Text(
                  accounType,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.unselectedIconColor,
                  ),
                ),
              ],
            ),
          ),
        ),
        Center(
          child: Text(
            "${isNaira ? "NGN" : "USD"}$balance",
            style: const TextStyle(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    ),
  );
}
