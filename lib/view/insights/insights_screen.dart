import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class InsightsScreen extends StatelessWidget {
  const InsightsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.whiteColor2,
        title: const Text(
          "Transfer",
          style: TextStyle(
            color: AppColors.blackColor,
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Center(
            child: Text("insight"),
          )
        ],
      ),
    );
  }
}
