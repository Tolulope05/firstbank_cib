import 'package:firstbank_cib/widgets/app_button.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';
import 'text_color_wrap.dart';

class ActionCenterCard extends StatelessWidget {
  const ActionCenterCard({
    Key? key,
    required this.recieverName,
    required this.recieverNumber,
    required this.narration,
    required this.amount,
    required this.paymentMethod,
    required this.onApprove,
    required this.isApproved,
  }) : super(key: key);

  final String recieverName;
  final String recieverNumber;
  final String narration;
  final String amount;
  final String paymentMethod;
  final VoidCallback onApprove;
  final bool isApproved;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.whiteColor2,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(1, 1),
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Receiver",
                  style: TextStyle(
                    color: AppColors.unselectedIconColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text.rich(
                  TextSpan(
                    text: '$recieverName ',
                    style: const TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      overflow: TextOverflow.ellipsis,
                    ),
                    children: <InlineSpan>[
                      TextSpan(
                        text: '- $recieverNumber',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff4B4B4B),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Narration",
                  style: TextStyle(
                    color: AppColors.unselectedIconColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  narration,
                  style: const TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Payment Method",
                  style: TextStyle(
                    color: AppColors.unselectedIconColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  paymentMethod,
                  style: const TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Amount",
                  style: TextStyle(
                    color: AppColors.unselectedIconColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  "₦ $amount",
                  style: const TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 12),
            child: isApproved
                ? const TextColorWrap(
                    text: "Approved",
                    textColor: Color(0xff0A5139),
                    color: Color(0xffE6F7E9),
                    textfontSize: 12,
                  )
                : AppButton(
                    onTap: onApprove,
                    text: "Take Action",
                    bgColor: Colors.transparent,
                    textColor: const Color(0xff2C2727),
                    borderColor: AppColors.primaryColor,
                  ),
          ),
        ],
      ),
    );
  }
}
