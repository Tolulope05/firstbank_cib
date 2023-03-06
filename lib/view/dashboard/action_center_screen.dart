import 'package:firstbank_cib/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../view_model/actioncenter_view_model.dart';
import '../../widgets/action_center_card.dart';

class ActionCenterScreen extends GetView<ActionCenterModel> {
  const ActionCenterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: AppColors.primaryColor,
            width: double.maxFinite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 50,
                    left: 16,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      controller.navigateback();
                    },
                    child: const Icon(
                      Icons.chevron_left,
                      size: 32,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    top: 24,
                    left: 24,
                    bottom: 22,
                  ),
                  child: Text(
                    "Action Center",
                    style: TextStyle(
                      color: AppColors.whiteColor,
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          //new section
          Container(
            margin: const EdgeInsets.only(left: 24, top: 24, bottom: 24),
            padding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 12 - 2),
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              border: Border.all(
                color: const Color(0XFFD1D5DB),
              ),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Utils.renderSVGImage(
                    assetName: "assets/svg/menu_arrow_down.svg"),
                const Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Text(
                    "All Account",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 24),
                    child: Text(
                      "Feb 28 2023",
                      style: TextStyle(
                        color: AppColors.unselectedIconColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 24,
                      horizontal: 24,
                    ),
                    child: ActionCenterCard(
                      recieverName: 'Layor Pan Enterprises',
                      recieverNumber: '0245728039',
                      narration: 'Website Payment Installment 2',
                      amount: '100,000.00',
                      paymentMethod: 'Intant Payment',
                      onApprove: () {
                        print("Hello World");
                      },
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 24),
                    child: Text(
                      "Feb 27 2023",
                      style: TextStyle(
                        color: AppColors.unselectedIconColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 24,
                      horizontal: 24,
                    ),
                    child: ActionCenterCard(
                      recieverName: 'Layor Pan Enterprises',
                      recieverNumber: '0245728039',
                      narration: 'Website Payment Installment 2',
                      amount: '100,000.00',
                      paymentMethod: 'Intant Payment',
                      onApprove: () {
                        print("Hello World");
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 24,
                      horizontal: 24,
                    ),
                    child: ActionCenterCard(
                      recieverName: 'Layor Pan Enterprises',
                      recieverNumber: '0245728039',
                      narration: 'Website Payment Installment 2',
                      amount: '100,000.00',
                      paymentMethod: 'Intant Payment',
                      onApprove: () {
                        print("Hello World");
                      },
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
