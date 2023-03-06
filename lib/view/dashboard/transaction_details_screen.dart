import 'package:firstbank_cib/constants/colors.dart';
import 'package:firstbank_cib/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    final controller = Get.find<ActionCenterModel>();
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
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 4),
                  child: Row(
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
                ),
                const Text(
                  "Feb 28 2023",
                  style: TextStyle(
                    color: AppColors.unselectedIconColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 16, bottom: 4),
                  child: TextColorWrap(
                    text: "Awaiting Approval",
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
                    children: const [
                      TransactionDetailsTab(),
                      ApprovalTabView(),
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
                                  setState(() {
                                    isSubmitted = true;
                                  });
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
                        )),
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
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Flexible(
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
      ),
    );
  }
}

class TransactionDetailsTab extends StatelessWidget {
  const TransactionDetailsTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Flexible(
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
                      children: const [
                        Text(
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
                            style: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              overflow: TextOverflow.ellipsis,
                            ),
                            children: <InlineSpan>[
                              TextSpan(
                                text: '- 0245728039',
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
                  ),
                  const CustomCardChildPosition(
                    prefixText: "Available Balance",
                    suffixText: "₦17,870,902",
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
                children: const [
                  CustomCardChildPosition(
                    prefixText: "Payment to",
                    suffixText: "Layor Pan Enterprises",
                  ),
                  CustomCardChildPosition(
                    prefixText: "Account Number",
                    suffixText: "0245728039",
                  ),
                  CustomCardChildPosition(
                    prefixText: "Bank Name",
                    suffixText: "X Bank",
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
                children: const [
                  CustomCardChildPosition(
                    prefixText: "Ampunt",
                    suffixText: "₦5,129,000",
                  ),
                  CustomCardChildPosition(
                    prefixText: "Fee",
                    suffixText: "₦718",
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
                children: const [
                  CustomCardChildPosition(
                    prefixText: "Narration",
                    suffixText: "Payment for Cox Communications",
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
                children: const [
                  CustomCardChildPosition(
                    prefixText: "Method",
                    suffixText: "Instant Payment",
                  ),
                  CustomCardChildPosition(
                    prefixText: "Type",
                    suffixText: "Other Payment",
                  ),
                  CustomCardChildPosition(
                    prefixText: "Value Date",
                    suffixText: "24/02/2023",
                  ),
                ],
              ),
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
