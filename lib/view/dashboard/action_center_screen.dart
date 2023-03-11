import 'package:firstbank_cib/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../view_model/actioncenter_view_model.dart';
import '../../widgets/action_center_card.dart';
import '../../widgets/shimmmer_page.dart';

class ActionCenterScreen extends GetView<ActionCenterViewModel> {
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
              // physics: NeverScrollableScrollPhysics(),
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
                  FutureBuilder(
                      future: controller.loadSinglePaymentResp(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 24,
                            ),
                            child: loadingShimmer(),
                          );
                        }
                        return ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          reverse: true,
                          shrinkWrap: true,
                          itemCount: controller
                                  .localPaymentResponse.payments?.length ??
                              0,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8,
                                horizontal: 24,
                              ),
                              child: ActionCenterCard(
                                recieverName: controller.localPaymentResponse
                                    .payments![index].beneficiaryName!,
                                amount: controller.localPaymentResponse
                                    .payments![index].amount!
                                    .toString(),
                                narration: controller.localPaymentResponse
                                    .payments![index].narration!,
                                paymentMethod: controller.localPaymentResponse
                                    .payments![index].paymentMethod!,
                                isApproved: controller.localPaymentResponse
                                        .payments![index].finalApprover!
                                    ? false
                                    : true,
                                recieverNumber: controller.localPaymentResponse
                                    .payments![index].accountNumber!,
                                onApprove: () {
                                  controller.navigateTotransactionDetails(
                                    controller
                                        .localPaymentResponse.payments![index],
                                  );
                                },
                              ),
                            );
                          },
                        );
                      }),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(
                  //     vertical: 24,
                  //     horizontal: 24,
                  //   ),
                  //   child: ActionCenterCard(
                  //     recieverName: 'Layor Pan Enterprises',
                  //     recieverNumber: '0245728039',
                  //     narration: 'Website Payment Installment 2',
                  //     amount: '5,129,000.00',
                  //     paymentMethod: 'Intant Payment',
                  //     isApproved: false,
                  //     onApprove: () {
                  //       controller.navigateTotransactionDetails();
                  //     },
                  //   ),
                  // ),
                  // const Padding(
                  //   padding: EdgeInsets.only(left: 24),
                  //   child: Text(
                  //     "Feb 27 2023",
                  //     style: TextStyle(
                  //       color: AppColors.unselectedIconColor,
                  //       fontSize: 12,
                  //       fontWeight: FontWeight.w400,
                  //     ),
                  //   ),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(
                  //     vertical: 24,
                  //     horizontal: 24,
                  //   ),
                  //   child: ActionCenterCard(
                  //     recieverName: '...on Yaga Ukechukwu',
                  //     recieverNumber: '0245728039',
                  //     narration: 'Refund for sales run',
                  //     amount: '5,129,000.00',
                  //     paymentMethod: 'Intant Payment',
                  //     isApproved: false,
                  //     onApprove: () {
                  //       controller.navigateTotransactionDetails();
                  //     },
                  //   ),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(
                  //     vertical: 24,
                  //     horizontal: 24,
                  //   ),
                  //   child: ActionCenterCard(
                  //     recieverName: 'Bazzi Foundation',
                  //     recieverNumber: '08342742912',
                  //     narration: 'Website Payment Installment 2',
                  //     amount: '250,129,000',
                  //     paymentMethod: 'RTGS',
                  //     isApproved: true,
                  //     onApprove: () {
                  //       controller.navigateTotransactionDetails();
                  //     },
                  //   ),
                  // ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
