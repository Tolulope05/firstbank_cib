import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';

class AddTransactionDialogue extends StatelessWidget {
  const AddTransactionDialogue({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      child: Container(
        // color: AppColors.scaffoldBgColor,
        padding: const EdgeInsets.symmetric(
          vertical: 30,
        ),
        child: Column(
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
                    "Select Orgnization",
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
            organizationTypewidget(),
            organizationTypewidget(),
          ],
        ),
      ),
    );
  }
}

Widget organizationTypewidget() {
  return Container(
    padding: const EdgeInsets.symmetric(
      vertical: 14,
      horizontal: 16,
    ),
    margin: const EdgeInsets.only(bottom: 8),
    decoration: BoxDecoration(
      color: AppColors.whiteColor2,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          spreadRadius: 0.5,
          blurRadius: 1,
          offset: const Offset(1, 1),
        ),
      ],
    ),
    child: Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "The Sharply Africa",
              style: TextStyle(
                color: AppColors.blackColor,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              "Organization ID:933787438",
              style: TextStyle(
                color: AppColors.unselectedIconColor,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        const Spacer(),
        const Center(
          child: Icon(
            Icons.check_outlined,
            color: AppColors.yellowColor3,
          ),
        ),
      ],
    ),
  );
}
