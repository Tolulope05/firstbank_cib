import 'package:firstbank_cib/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                padding: EdgeInsets.all(20.0),
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
            height: 100,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("bg_hello.png"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
