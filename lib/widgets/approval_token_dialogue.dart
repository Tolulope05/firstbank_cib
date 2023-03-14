import 'package:firstbank_cib/view_model/view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';

class ApprovalTokenDialogue extends StatelessWidget {
  const ApprovalTokenDialogue({
    Key? key,
    required this.isApproved,
  }) : super(key: key);
  final bool isApproved;

  @override
  Widget build(BuildContext context) {
    ActionCenterViewModel controller = Get.find<ActionCenterViewModel>();
    return Dialog(
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              bottom: 24,
              top: 24,
            ),
            child: Row(
              children: [
                const Text(
                  "Enter Approval Token",
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
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 24),
            child: TextField(
              controller: controller.approvalTokenController,
              maxLength: 8,
              onChanged: (value) {
                if (value.length == 8) {
                  controller.approvalTokenController.text = value;
                  Get.back();
                  controller.approvePayment(
                    approve: true,
                    paymentId: controller.paymentDetails.id!.toInt(),
                    batchID: controller.paymentDetails.batchid,
                  );
                }
              },
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: "Enter Approval Token",
                focusColor: AppColors.primaryColor,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.primaryColor,
                    width: 2,
                  ),
                ),
                hintStyle: TextStyle(
                  color: AppColors.blackColor,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
