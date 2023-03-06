import 'package:firstbank_cib/widgets/app_button.dart';
import 'package:firstbank_cib/widgets/transaction_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../view_model/dashboard_view_model.dart';
import '../../widgets/select_account_dialogue.dart';

class DashBoardScreen extends GetView<DashBoardviewModel> {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: AppColors.primaryColor,
            width: double.maxFinite,
            child: Column(
              children: [
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(
                        left: 13,
                        top: kToolbarHeight,
                      ),
                      child: Text(
                        'Good Morning, Layor',
                        style: TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 13,
                        top: kToolbarHeight,
                      ),
                      child: Container(
                        height: 32,
                        width: 32,
                        decoration: BoxDecoration(
                          color: const Color(0xffFAEBBE),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Icon(
                          Icons.headset_mic_outlined,
                          color: AppColors.yellowColor3,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 13,
                        top: kToolbarHeight,
                      ),
                      child: Container(
                        height: 32,
                        width: 32,
                        decoration: BoxDecoration(
                          color: const Color(0xffBCCCE1),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Icon(
                          Icons.notifications_none,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
                // custom dropdownmenu
                Container(
                  padding: const EdgeInsets.all(8.0),
                  margin: const EdgeInsets.only(top: 36, bottom: 24),
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(60),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) => const SelectAccountDialogue());
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/naira_dollar.png",
                          width: 24,
                          height: 16,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 9, right: 11),
                          child: Text(
                            "All account (8)",
                            style: TextStyle(
                              color: Color(0xff1E1E1E),
                            ),
                          ),
                        ),
                        const RotatedBox(
                          quarterTurns: 45,
                          child: Icon(
                            Icons.chevron_right,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Text(
                  "Float account",
                  style: TextStyle(color: AppColors.unselectedIconColor),
                ),
                Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "NGN 17,000,481",
                        style: TextStyle(
                          fontSize: 24,
                          color: AppColors.whiteColor2,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.visibility_off,
                          color: AppColors.whiteColor2,
                        ),
                      ),
                    ],
                  ),
                ),
                const Text(
                  "NGN 7,000,481 available",
                  style: TextStyle(
                    color: AppColors.unselectedIconColor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 35,
                    top: 24,
                    right: 24,
                    left: 24,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            controller.navigateToActionCenter();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: AppColors.yellowColor3,
                            ),
                            padding: const EdgeInsets.all(12),
                            child: Row(children: [
                              const Text(
                                "Action Center",
                                style: TextStyle(
                                  color: AppColors.greyColor2,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(
                                  right: 0, //8 => Already taaken by IconButton
                                ),
                                child: Container(
                                  height: 24,
                                  width: 24,
                                  decoration: BoxDecoration(
                                    color: const Color(0xffE4E4E4),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: const Center(
                                      child: Text(
                                    "8",
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  )),
                                ),
                              ),
                              GestureDetector(
                                  onTap: () {},
                                  child: const Icon(
                                    Icons.chevron_right,
                                  ))
                            ]),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          margin: const EdgeInsets.only(left: 8),
                          decoration: BoxDecoration(
                            color: AppColors.primaryColorDeep,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          height: 50,
                          width: 50,
                          child: const Icon(
                            Icons.more_horiz,
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.only(top: 24, left: 24, right: 24),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "For you",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "Show all",
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.yellowColor,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Stack(
                        children: [
                          Positioned(
                            child: Center(
                              child: Container(
                                height: 170,
                                width: MediaQuery.of(context).size.width -
                                    48 -
                                    20 -
                                    20,
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: AppColors.whiteColor,
                                  boxShadow: [
                                    BoxShadow(
                                      color:
                                          AppColors.blackColor.withOpacity(0.1),
                                      blurRadius: 1,
                                      offset: const Offset(
                                        0,
                                        1,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            child: Center(
                              child: Container(
                                height: 160,
                                width:
                                    MediaQuery.of(context).size.width - 48 - 20,
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: AppColors.whiteColor,
                                  boxShadow: [
                                    BoxShadow(
                                      color:
                                          AppColors.blackColor.withOpacity(0.1),
                                      blurRadius: 1,
                                      offset: const Offset(
                                        0,
                                        1,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 150,
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: AppColors.whiteColor,
                                boxShadow: [
                                  BoxShadow(
                                    color:
                                        AppColors.blackColor.withOpacity(0.1),
                                    blurRadius: 8,
                                    offset: const Offset(
                                      0,
                                      4,
                                    ),
                                  )
                                ]),
                            child: Row(
                              children: [
                                Flexible(
                                  flex: 3,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "Apply for loan",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xff1E1E1E),
                                        ),
                                      ),
                                      const Text(
                                        "Get instant access to an affordable loan at on your terms ",
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.textColor,
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 40),
                                        child: AppButton(
                                          onTap: () {},
                                          text: "Calculate",
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Flexible(
                                  flex: 2,
                                  child: Center(
                                    child: Image.asset(
                                        "assets/images/money_hand.png"),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "Last transactions --->",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Expanded(child: SizedBox()),
                            ],
                          ),
                          const TransactionCard(
                            userName: "Layor Salami",
                            date: "Jan 10 2023",
                            amount: "10,000",
                            // status: "Processed",
                            isIncome: true,
                          ),
                          const TransactionCard(
                            userName: "Layor Pan Enterprises",
                            date: "Jan 10 2023",
                            amount: "5,129,000",
                            status: "Processed",
                            isIncome: false,
                          ),
                          const TransactionCard(
                            userName: "Transfer Commission",
                            date: "Jan 10 2023",
                            amount: "50",
                            status: "Processed",
                            isIncome: false,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 100), // to be remo
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
