import 'package:firstbank_cib/constants/colors.dart';
import 'package:firstbank_cib/widgets/text_field_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/utils.dart';
import '../../view_model/sign_in_view_model.dart';

class SignInScreen extends GetView<SignInViewModel> {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: kToolbarHeight + 50,
            color: AppColors.primaryColor,
            width: double.maxFinite,
            child: const Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.all(24.0),
                child: Text(
                  'Logo',
                  style: TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 150,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            width: double.maxFinite,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/bg_hello.png"),
              ),
            ),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Text(
                      'Hello',
                      style: TextStyle(
                        color: AppColors.blackColor,
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'Sign in to your X CIB',
                      style: TextStyle(
                        color: AppColors.textColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Container(),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 7,
                      ),
                      margin: const EdgeInsets.only(top: 30),
                      decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(60),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.blackColor.withOpacity(0.05),
                              blurRadius: 1,
                              spreadRadius: 1,
                              offset: const Offset(4, 5), // Shadow position
                            ),
                          ]),
                      child: Row(
                        children: [
                          Utils.renderSVGImage(
                            assetName: 'assets/svg/support.svg',
                            width: 16.0,
                            height: 16.0,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: Text(
                              "Need help?",
                              style: TextStyle(
                                color: AppColors.textColor,
                                fontSize: 14,
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          AppTextFieldInput(),
          AppTextFieldInput(),
        ],
      ),
    );
  }
}
