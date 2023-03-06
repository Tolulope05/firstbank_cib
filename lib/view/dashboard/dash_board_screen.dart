import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class DashBoardScreen extends StatelessWidget {
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
                const Text(
                  "Float account",
                  style: TextStyle(color: Color(0xFF898A8D)),
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
                  style: TextStyle(color: Color(0xFF898A8D)),
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
                                child: Icon(
                                  Icons.chevron_right,
                                  // size: 1,
                                ))
                          ]),
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
        ],
      ),
    );
  }
}
