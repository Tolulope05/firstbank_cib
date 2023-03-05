import 'package:flutter/material.dart';

import '../constants/colors.dart';

class AppAppBar extends StatelessWidget {
  const AppAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kToolbarHeight + 50,
      color: AppColors.primaryColor,
      width: double.maxFinite,
      child: const Align(
        alignment: Alignment.bottomLeft,
        child: Padding(
          padding: EdgeInsets.all(24.0),
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
    );
  }
}
