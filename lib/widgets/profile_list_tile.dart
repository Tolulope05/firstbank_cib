import 'package:firstbank_cib/constants/colors.dart';
import 'package:firstbank_cib/utils/utils.dart';
import 'package:flutter/material.dart';

class ProfileListTile extends StatelessWidget {
  const ProfileListTile({
    Key? key,
    this.bgColor,
    this.textColor,
    required this.svgName,
    required this.title,
    this.chevronColor,
    this.svgColor,
  }) : super(key: key);

  final String svgName;
  final Color? bgColor;
  final Color? textColor;
  final Color? chevronColor;
  final String title;
  final Color? svgColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(top: 12),
      decoration: BoxDecoration(
        color: bgColor ?? AppColors.whiteColor2,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Utils.renderSVGImage(
            assetName: svgName,
            height: 20.00,
            width: 20.0,
            color: svgColor ?? AppColors.primaryColor,
          ),
          const SizedBox(
            width: 16,
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: textColor ?? AppColors.textColor2,
            ),
          ),
          const Spacer(),
          Icon(
            Icons.chevron_right,
            color: chevronColor ?? AppColors.chevronBlackColor,
          ),
        ],
      ),
    );
  }
}
