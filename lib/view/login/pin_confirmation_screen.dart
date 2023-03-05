import 'package:firstbank_cib/constants/colors.dart';
import 'package:firstbank_cib/widgets/app_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view_model/pin_confirmation_model.dart';
import '../../widgets/rounded_pinput.dart';

class PinConfirmationScreen extends GetView<PinConfirmationModel> {
  const PinConfirmationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppAppBar(),
          Padding(
            padding: const EdgeInsets.only(
              top: 59,
              left: 16,
            ),
            child: GestureDetector(
              onTap: () => controller.goToSignInPage(),
              child: const Icon(
                Icons.chevron_left,
                size: 32,
                color: AppColors.chevronBlackColor,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              top: 24,
              left: 24,
              right: 24,
            ),
            child: Text(
              "PIN Confirmation",
              style: TextStyle(
                color: AppColors.blackColor,
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              top: 12,
              left: 24,
              right: 24,
            ),
            child: Text(
              "Please input your secured token pin to log in to your account",
              style: TextStyle(
                color: AppColors.textColor3,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 17,
              vertical: 32,
            ),
            child: Center(
              child: FilledRoundedPinPut(),
            ),
          ),
        ],
      ),
    );
  }
}
