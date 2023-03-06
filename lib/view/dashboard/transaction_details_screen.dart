import 'package:firstbank_cib/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view_model/actioncenter_view_model.dart';
import '../../widgets/text_color_wrap.dart';

class TransactionDetailsScreen extends GetView<ActionCenterModel> {
  const TransactionDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.scaffoldBgColor,
        leading: GestureDetector(
          onTap: () {
            controller.navigateback();
          },
          child: const Icon(
            Icons.chevron_left,
            size: 32,
            color: AppColors.chevronBlackColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "- ₦5,129,000",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: AppColors.failedColor,
                  ),
                ),
                Image.asset(
                  "assets/images/outgoing.png",
                  width: 32,
                  height: 32,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text(
                  "Receiver: ",
                  style: TextStyle(
                    color: AppColors.unselectedIconColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text.rich(
                  TextSpan(
                    text: 'Layor Pan Enterprises',
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      overflow: TextOverflow.ellipsis,
                    ),
                    children: <InlineSpan>[
                      TextSpan(
                        text: ' - 0245728039',
                        style: TextStyle(
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
            const Text(
              "Feb 28 2023",
              style: TextStyle(
                color: AppColors.unselectedIconColor,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
            const TextColorWrap(
              text: "Awaiting Approval",
              textColor: AppColors.yellowColor3,
              color: Color(0xffECE4CD),
              textfontSize: 12,
            )
          ],
        ),
      ),
    );
  }
}
