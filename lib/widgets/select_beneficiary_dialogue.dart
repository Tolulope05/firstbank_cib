import 'package:firstbank_cib/constants/colors.dart';
import 'package:firstbank_cib/view_model/view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectBeneficiaryDialogue extends StatelessWidget {
  const SelectBeneficiaryDialogue({Key? key, required this.selector})
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
                    "Select Beneficiary",
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
                itemCount: controller.beneficiarylist.length,
                itemBuilder: (context, index) {
                  return accountTypeWidget(
                    accountNumber:
                        controller.beneficiarylist[index].accountName ?? "",
                    accounType:
                        controller.beneficiarylist[index].accountNumber ?? "",
                    onTap: () {
                      controller.selectBeneficiaryFromDialogue(index);
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
                      fontSize: 14,
                      color: AppColors.unselectedIconColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
