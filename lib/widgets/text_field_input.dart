import 'package:firstbank_cib/constants/colors.dart';
import 'package:flutter/material.dart';

class AppTextFieldInput extends StatelessWidget {
  const AppTextFieldInput({Key? key}) : super(key: key);
  final String headerText = 'Hello';
  final String hintText = 'Enter your email';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          headerText,
          style: const TextStyle(
            color: AppColors.textColor2,
            fontSize: 12,
          ),
        ),
        TextFormField(
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(
                color: AppColors.primaryColor,
              ),
            ),
            hintText: hintText,
            hintStyle: const TextStyle(
              color: AppColors.lightGreyColor,
              fontSize: 14,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
      ],
    );
  }
}
