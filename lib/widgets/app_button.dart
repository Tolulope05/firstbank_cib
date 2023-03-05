import 'package:firstbank_cib/constants/colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: InkWell(
        onTap: () {
          if (kDebugMode) {
            // debug print
            print("Button tapped");
          }
        },
        child: const Center(
            child: Text(
          "Sign in",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        )),
      ),
    );
  }
}
