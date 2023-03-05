import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Utils {
  static Widget renderSVGImage({
    assetName,
    width,
    height,
  }) {
    final Widget svgIcon = SvgPicture.asset(
      assetName,
      height: height,
      width: width,
      semanticsLabel: assetName,
    );
    return svgIcon;
  }
}
