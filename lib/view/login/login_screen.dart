import 'package:firstbank_cib/constants/colors.dart';
import 'package:firstbank_cib/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../view_model/login_view_model.dart';

class Logincreen extends GetView<LoginViewModel> {
  const Logincreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/brush_pen_bg.png"),
              Expanded(child: Container()),
              SmoothPageIndicator(
                controller: controller.pageController,
                count: 4,
                effect: const ExpandingDotsEffect(
                  dotHeight: 8,
                  dotWidth: 8,
                  dotColor: AppColors.greyColor,
                  activeDotColor: AppColors.primaryColor,
                  spacing: 8,
                  expansionFactor: 1.5,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32),
                child: AppButton(
                  borderColor: AppColors.primaryColor,
                  bgColor: AppColors.primaryColor,
                  text: "Sign in",
                  textColor: AppColors.whiteColor,
                  onTap: () {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("New to Xbank?"),
                    const SizedBox(width: 8),
                    InkWell(
                      onTap: () {},
                      child: const Text(
                        "Register",
                        style: TextStyle(
                          color: AppColors.yellowColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 71,
            left: 20,
            right: 20,
            child: SizedBox(
              height: 453 + 68,
              child: PageView(controller: controller.pageController, children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      "assets/images/login_1.png",
                      height: 453,
                      width: 324,
                    ),
                    const Text(
                      "Welcome to our corporate banking app!",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 24,
                        color: AppColors.blackColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Image.asset(
                      "assets/images/login_2.png",
                      height: 453,
                      width: 324,
                    ),
                    const Text(
                      "Access a wide range of banking services.",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 24,
                        color: AppColors.blackColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Image.asset(
                      "assets/images/login_3.png",
                      height: 453,
                      width: 324,
                    ),
                    const Text(
                      "Manage your finances on-the-go with ease",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 24,
                        color: AppColors.blackColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Image.asset(
                      "assets/images/login_4.png",
                      height: 453,
                      width: 324,
                    ),
                    const Text(
                      "Streamline your banking experience.",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 24,
                        color: AppColors.blackColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
