import 'package:firstbank_cib/constants/colors.dart';
import 'package:flutter/material.dart';

class TransactionCard extends StatelessWidget {
  TransactionCard({
    Key? key,
    required this.userName,
    required this.date,
    required this.isIncome,
    required this.amount,
    this.status,
  }) : super(key: key);
  final String userName;
  final String date;
  final String amount;
  final String? status;
  final bool isIncome;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 12,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          //column 1
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                isIncome
                    ? "assets/images/incoming.png"
                    : "assets/images/outgoing.png",
                width: 32,
                height: 32,
              )
            ],
          ),
          //column 2
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userName,
                    style: const TextStyle(
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    date,
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.unselectedIconColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
          //column 3
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "${isIncome ? "+" : "-"} NGN $amount",
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.successColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  status ?? "",
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
