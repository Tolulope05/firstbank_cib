import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';

class ApprovalTokenDialogue extends StatelessWidget {
  const ApprovalTokenDialogue({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Column(
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
                  "Input Approval Token",
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
        ],
      ),
    );
  }
}
