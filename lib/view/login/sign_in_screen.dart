import 'package:firstbank_cib/constants/colors.dart';
import 'package:firstbank_cib/widgets/app_button.dart';
import 'package:firstbank_cib/widgets/text_field_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/utils.dart';
import '../../view_model/sign_in_view_model.dart';
import '../../widgets/app_app_bar.dart';

class SignInScreen extends GetView<SignInViewModel> {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              const AppAppBar(),
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
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 12.0,
                  top: 24,
                  right: 24.0,
                  left: 24.0,
                ),
                child: AppTextFieldInput(
                  controller: controller.organizationCodeController,
                  headerText: 'Organization Code',
                  hintText: 'Organization code',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter organization code';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 12.0,
                  horizontal: 24.0,
                ),
                child: AppTextFieldInput(
                  controller: controller.usernameController,
                  headerText: 'Username',
                  hintText: 'Corporate ID',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter username';
                    } else if (value.length < 6) {
                      return 'Username must be at least 6 characters';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 12.0,
                  horizontal: 24.0,
                ),
                child: AppTextFieldInput(
                  controller: controller.passwordController,
                  headerText: 'Password',
                  hintText: 'Password',
                  obscureText: false,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter password';
                    } else if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    } else if (value.length > 20) {
                      return 'Password must be less than 20 characters';
                    } else if (!value.contains(RegExp(r'[A-Z]'))) {
                      return 'Password must contain at least one uppercase letter';
                    } else if (!value.contains(RegExp(r'[a-z]'))) {
                      return 'Password must contain at least one lowercase letter';
                    } else if (!value.contains(RegExp(r'[0-9]'))) {
                      return 'Password must contain at least one number';
                    } else if (!value
                        .contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
                      return 'Password must contain at least one special character';
                    } else if (value.contains(RegExp(r'\s'))) {
                      return 'Password must not contain any whitespace';
                    }
                    return null;
                  },
                  suffixIcon: const Icon(
                    Icons.visibility_off,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(
                    bottom: 40.0,
                    left: 24,
                    top: 12,
                  ),
                  child: GestureDetector(
                    onTap: () {},
                    child: const Text(
                      "Forgot password?",
                      style: TextStyle(
                        color: AppColors.yellowColor2,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: AppButton(
                  onTap: () {
                    controller.navigateToPinConfirmationScreen();
                  },
                  text: "Sign In to your account ",
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 24,
                  left: 24,
                  top: 16,
                ),
                child: AppButton(
                  onTap: () => controller.navigateToPinConfirmationScreen(),
                  bgColor: Colors.transparent,
                  textColor: AppColors.primaryColor,
                  // text: "Sign in with face ID",
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Utils.renderSVGImage(
                          assetName: 'assets/svg/face_id.svg',
                          width: 16.0,
                          height: 16.0,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 12),
                          child: Text(
                            "Sign in with face ID",
                            style: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 16,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
