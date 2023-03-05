import 'package:firstbank_cib/constants/colors.dart';
import 'package:flutter/material.dart';

class AppTextFieldInput extends StatefulWidget {
  AppTextFieldInput({
    Key? key,
    this.suffixIcon,
    required this.headerText,
    required this.hintText,
    required this.controller,
    required this.obscureText,
  }) : super(key: key);
  final String headerText;
  final String hintText;
  final TextEditingController controller;
  bool obscureText;
  final Widget? suffixIcon;

  @override
  State<AppTextFieldInput> createState() => _AppTextFieldInputState();
}

class _AppTextFieldInputState extends State<AppTextFieldInput> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            widget.headerText,
            style: const TextStyle(
              color: AppColors.textColor2,
              fontSize: 12,
            ),
          ),
        ),
        TextFormField(
          obscureText: widget.obscureText,
          controller: widget.controller,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(
                color: AppColors.primaryColor,
              ),
            ),
            hintText: widget.hintText,
            hintStyle: const TextStyle(
              color: AppColors.lightGreyColor,
              fontSize: 14,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            suffixIcon: GestureDetector(
              onTap: () {
                if (widget.suffixIcon != null) {
                  setState(() {
                    widget.obscureText = !widget.obscureText;
                  });
                }
              },
              child: widget.suffixIcon ?? const SizedBox.shrink(),
            ),
            focusColor: AppColors.primaryColor,
          ),
        ),
      ],
    );
  }
}
