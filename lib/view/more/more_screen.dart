import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.whiteColor2,
        title: const Text(
          "More",
          style: TextStyle(
            color: AppColors.blackColor,
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Column(
        children: const [],
      ),
    );
  }
}
