import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';

class Utils {
  static Widget renderSVGImage({
    assetName,
    width,
    height,
    color,
  }) {
    final Widget svgIcon = SvgPicture.asset(
      assetName,
      height: height,
      width: width,
      semanticsLabel: assetName,
      // ignore: deprecated_member_use
      color: color,
    );
    return svgIcon;
  }

  static getsnackbar({
    required String title,
    required String message,
    Color? backgroundColor,
    Color? colorText,
    SnackPosition? snackPosition,
  }) {
    Get.snackbar(
      title,
      message,
      backgroundColor:
          backgroundColor ?? AppColors.primaryColor.withOpacity(0.9),
      colorText: colorText ?? AppColors.whiteColor,
      snackPosition: snackPosition ?? SnackPosition.BOTTOM,
    );
  }
}
