import 'package:flutter/material.dart';

class FloatingNavBarItem {
  IconData? iconData;

  String title;

  String iconSvgName;

  Widget page;
  FloatingNavBarItem({
    this.iconData,
    required this.iconSvgName,
    required this.title,
    required this.page,
  });
}
