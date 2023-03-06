import 'package:firstbank_cib/constants/colors.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    required this.onTap,
    this.text,
    this.bgColor,
    this.textColor,
    this.borderColor,
    this.child,
  }) : super(key: key);
  final VoidCallback onTap;
  final String? text;
  final Color? bgColor;
  final Color? textColor;
  final Color? borderColor;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: bgColor ?? AppColors.primaryColor,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: borderColor ?? AppColors.primaryColor,
          width: 1,
        ),
      ),
      child: InkWell(
        onTap: onTap,
        child: child ??
            Center(
                child: Text(
              text ?? 'Enter',
              style: TextStyle(
                color: textColor ?? Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            )),
      ),
    );
  }
}
