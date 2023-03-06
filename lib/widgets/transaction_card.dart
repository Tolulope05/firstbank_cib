import 'package:firstbank_cib/constants/colors.dart';
import 'package:flutter/material.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 12,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //column 1
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                "assets/images/incoming.png",
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
                children: const [
                  Text(
                    "Layor Salami",
                    style: TextStyle(
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "Jan 10 2023",
                    style: TextStyle(
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
              children: const [
                Text(
                  "+ NGN 10,000",
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.successColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "Processed",
                  style: TextStyle(
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
