import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
}
