import 'package:flutter/material.dart';

import '../constants/colors.dart';

class CustomCardChildPosition extends StatelessWidget {
  const CustomCardChildPosition({
    super.key,
    required this.prefixText,
    required this.suffixText,
  });
  final String prefixText;
  final String suffixText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            prefixText,
            style: const TextStyle(
              color: AppColors.unselectedIconColor,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          Flexible(
            child: Text(
              suffixText,
              style: const TextStyle(
                color: AppColors.primaryColor,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
