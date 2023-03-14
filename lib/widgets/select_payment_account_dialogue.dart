import 'package:firstbank_cib/constants/colors.dart';
import 'package:firstbank_cib/view_model/view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectPaymentAccountDialogue extends StatelessWidget {
  const SelectPaymentAccountDialogue({Key? key, required this.selector})
      : super(key: key);
  final int selector;

  @override
  Widget build(BuildContext context) {
    TransferScreenViewModel controller = Get.put(TransferScreenViewModel());
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
            Container(
              constraints: BoxConstraints.tight(const Size.fromHeight(400)),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: controller.accountList.length,
                itemBuilder: (context, index) {
                  return accountTypeWidget(
                    accountNumber:
                        controller.accountList[index].accountName ?? "",
                    accounType:
                        controller.accountList[index].accountNumber ?? "",
                    balance: controller.accountList[index].availableBalance
                        .toString(),
                    currency: controller.accountList[index].currency!,
                    onTap: () {
                      controller.selectAccountfromDialogue(index, selector);
                    },
                  );
                },
              ),
            ),
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
  required String currency,
  VoidCallback? onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
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
              currency.toUpperCase().trim() == "NGN"
                  ? "assets/images/naira.png"
                  : "assets/images/dollar.png", // a better implementation of this soon
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
          // Center(
          //   child: Text(
          //     "$currency $balance",
          //     style: const TextStyle(
          //       color: AppColors.primaryColor,
          //       fontWeight: FontWeight.w500,
          //     ),
          //   ),
          // ),
        ],
      ),
    ),
  );
}
