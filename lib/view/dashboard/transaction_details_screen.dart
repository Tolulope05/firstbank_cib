import 'package:firstbank_cib/constants/colors.dart';
import 'package:firstbank_cib/model/model.dart';
import 'package:firstbank_cib/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../view_model/actioncenter_view_model.dart';
import '../../widgets/approval_child_position.dart';
import '../../widgets/tab_child_position.dart';
import '../../widgets/text_color_wrap.dart';

class TransactionDetailsScreen extends StatefulWidget {
  const TransactionDetailsScreen({Key? key}) : super(key: key);

  @override
  State<TransactionDetailsScreen> createState() =>
      _TransactionDetailsScreenState();
}

class _TransactionDetailsScreenState extends State<TransactionDetailsScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  bool isSubmitted = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
    // _tabController.animateTo(1);
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ActionCenterViewModel>();
    final paymentDetails = controller.paymentDetails;
    // DateTime parsing
    String returnFormattedDate(DateTime dateTime) {
      // DateTime dateTime = DateTime.parse(date);
      String formattedDateTime =
          DateFormat.yMMMMd("en_US").add_jm().format(dateTime);
      return formattedDateTime;
    }

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
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "- ₦ ${paymentDetails.amount}",
                      style: const TextStyle(
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
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Receiver: ",
                        style: TextStyle(
                          color: AppColors.unselectedIconColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Flexible(
                        child: Text.rich(
                          TextSpan(
                            text: paymentDetails.beneficiaryName,
                            style: const TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              overflow: TextOverflow.ellipsis,
                            ),
                            children: <InlineSpan>[
                              TextSpan(
                                text: ' - ${paymentDetails.accountNumber}',
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff4B4B4B),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  returnFormattedDate(
                    paymentDetails.requestdatetime ?? DateTime.now(),
                  ),
                  style: const TextStyle(
                    color: AppColors.unselectedIconColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16, bottom: 4),
                  child: TextColorWrap(
                    text: "${paymentDetails.approvalStatus}",
                    textColor: AppColors.yellowColor3,
                    color: Color(0xffECE4CD),
                    textfontSize: 12,
                  ),
                ),
                SizedBox(
                  child: TabBar(
                    controller: _tabController,
                    labelColor: Colors.black,
                    indicatorColor: AppColors.yellowColor3,
                    unselectedLabelColor: AppColors.unselectedIconColor,
                    unselectedLabelStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    labelStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    tabs: const [
                      Tab(
                        text: "Transaction Details",
                      ),
                      Tab(
                        text: "Approval Involved",
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      TransactionDetailsTab(paymentDetails: paymentDetails),
                      ApprovalTabView(paymentDetails: paymentDetails),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            child: Material(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 70,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: !isSubmitted
                    ? Row(
                        children: [
                          Flexible(
                            child: AppButton(
                              onTap: () {
                                // setState(() {
                                //   isSubmitted = true;
                                // });
                                controller.approvePayment(
                                  approve: true,
                                  paymentId: paymentDetails.id!.toInt(),
                                  batchID: paymentDetails.batchid,
                                );
                              },
                              text: "Approve",
                            ),
                          ),
                          const SizedBox(width: 20),
                          Flexible(
                            child: AppButton(
                              onTap: () {},
                              text: "Decline",
                              textColor: AppColors.failedColor,
                              borderColor: AppColors.failedColor,
                              bgColor: Colors.transparent,
                            ),
                          ),
                        ],
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: AppButton(
                          onTap: () {
                            setState(() {
                              isSubmitted = false;
                            });
                          },
                          bgColor: Colors.transparent,
                          borderColor: AppColors.primaryColor,
                          textColor: AppColors.primaryColor,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.print_sharp,
                                color: AppColors.primaryColor,
                              ),
                              SizedBox(width: 8),
                              Text(
                                "Download",
                                style: TextStyle(
                                  color: AppColors.primaryColor,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ApprovalTabView extends StatelessWidget {
  const ApprovalTabView({
    super.key,
    required this.paymentDetails,
  });
  final Paymentt paymentDetails;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          ApprovalchildPosition(
            statusColor: AppColors.primaryColor,
            userStatus: "Initiated",
            time: "Feb 30, 2023 05:18",
            usename: "Dada Sparco",
            userPosition: "Accountant",
          ),
          ApprovalchildPosition(
            statusColor: AppColors.successColor,
            userStatus: "●  Approved",
            time: "Feb 29, 2023 19:28",
            usename: "Muharrem Kavak",
            userPosition: "Admin",
          ),
          ApprovalchildPosition(
            statusColor: AppColors.failedColor,
            userStatus: "●  Declined",
            time: "Feb 27, 2023 23:26",
            usename: "DFadime Yalcinkaya",
            userPosition: "Accountant",
          ),
          ApprovalchildPosition(
            statusColor: AppColors.primaryColor,
            userStatus: "●  Awaiting Response",
            // time: "Feb 30, 2023 05:18",
            usename: "Dada Sparco",
            userPosition: "Accountant",
          ),
        ],
      ),
    );
  }
}

class TransactionDetailsTab extends StatelessWidget {
  const TransactionDetailsTab({
    super.key,
    required this.paymentDetails,
  });
  final Paymentt paymentDetails;

  @override
  Widget build(BuildContext context) {
    ActionCenterViewModel actionCenterViewModel =
        Get.find<ActionCenterViewModel>();
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 16),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            decoration: BoxDecoration(
              color: AppColors.whiteColor2,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Source Account",
                        style: TextStyle(
                          color: AppColors.unselectedIconColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text.rich(
                        TextSpan(
                          text: 'Float Account ',
                          style: const TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            overflow: TextOverflow.ellipsis,
                          ),
                          children: <InlineSpan>[
                            TextSpan(
                              text: '- ${paymentDetails.sourceAccountNumber}',
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
                FutureBuilder(
                  future: actionCenterViewModel
                      .loadAccountBalance(paymentDetails.sourceAccountNumber!),
                  builder: (_, __) {
                    if (__.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: SpinKitThreeBounce(
                          color: AppColors.primaryColor,
                          size: 20,
                        ),
                      );
                    }

                    return Obx(
                      () => CustomCardChildPosition(
                        prefixText: "Available Balance",
                        suffixText:
                            "₦ ${actionCenterViewModel.accountBalance} ",
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 16),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            decoration: BoxDecoration(
              color: AppColors.whiteColor2,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                CustomCardChildPosition(
                  prefixText: "Payment to",
                  suffixText: "${paymentDetails.beneficiaryName}",
                ),
                CustomCardChildPosition(
                  prefixText: "Account Number",
                  suffixText: "${paymentDetails.accountNumber}",
                ),
                CustomCardChildPosition(
                  prefixText: "Bank Name",
                  suffixText: "${paymentDetails.bankName}",
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 16),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            decoration: BoxDecoration(
              color: AppColors.whiteColor2,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                CustomCardChildPosition(
                  prefixText: "Ampunt",
                  suffixText: "₦ ${paymentDetails.amount}",
                ),
                CustomCardChildPosition(
                  prefixText: "Fee",
                  suffixText: "₦ ${paymentDetails.charges}",
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 16),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            decoration: BoxDecoration(
              color: AppColors.whiteColor2,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                CustomCardChildPosition(
                  prefixText: "Narration",
                  suffixText: "${paymentDetails.narration}",
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 16),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            decoration: BoxDecoration(
              color: AppColors.whiteColor2,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                CustomCardChildPosition(
                  prefixText: "Method",
                  suffixText: "${paymentDetails.paymentMethod}}",
                ),
                CustomCardChildPosition(
                  prefixText: "Type",
                  suffixText: "${paymentDetails.paymentType ?? "N/A"}",
                ),
                CustomCardChildPosition(
                  prefixText: "Value Date",
                  suffixText: "${paymentDetails.valueDate}",
                ),
              ],
            ),
          ),
          const SizedBox(height: 100),
        ],
      ),
    );
  }
}
