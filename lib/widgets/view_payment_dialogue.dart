import 'package:firstbank_cib/constants/colors.dart';
import 'package:firstbank_cib/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view_model/view_model.dart';

class ViewPaymentDialogue extends StatelessWidget {
  const ViewPaymentDialogue({Key? key, required this.onTap}) : super(key: key);
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    TransferScreenViewModel controller = Get.find<TransferScreenViewModel>();
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                bottom: 24,
              ),
              child: Row(
                children: [
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
            Image.asset(
              "assets/images/payment_initiated.png",
              width: 161,
              height: 161,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 24, bottom: 12),
              child: Text(
                "Payment Initiated",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.blackColor,
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const Text(
              "Proceed to approve payment to complete transaction ",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.blackColor,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            Obx(
              () => Padding(
                padding: const EdgeInsets.only(top: 24),
                child: controller.isAccountPaymentLoading
                    ? AppButton(
                        onTap: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          ],
                        ),
                      )
                    : AppButton(
                        onTap: () => onTap(),
                        text: "Verify transaction",
                      ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
