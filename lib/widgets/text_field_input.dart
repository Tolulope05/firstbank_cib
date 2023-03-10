import 'package:firstbank_cib/constants/colors.dart';
import 'package:flutter/material.dart';

class AppTextFieldInput extends StatefulWidget {
  AppTextFieldInput({
    Key? key,
    this.suffixIcon,
    required this.headerText,
    required this.hintText,
    required this.controller,
    this.validator,
    this.obscureText = false,
    this.readOnly = false,
    this.isNumberonly = false,
    this.isPassword,
  }) : super(key: key);
  final String headerText;
  final String hintText;
  final TextEditingController controller;
  bool obscureText;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  bool? isPassword;
  bool readOnly;
  bool isNumberonly;

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
          keyboardType: widget.isPassword == true
              ? TextInputType.visiblePassword
              : widget.isNumberonly
                  ? TextInputType.number
                  : TextInputType.text,
          readOnly: widget.readOnly,
          obscureText: widget.obscureText,
          controller: widget.controller,
          validator: widget.validator,
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
                //password function when suffix only
                if (widget.suffixIcon != null && widget.isPassword == true) {
                  setState(() {
                    widget.obscureText = !widget.obscureText;
                  });
                } else {
                  // we can pass every other function here
                }
              },
              child: widget.obscureText != true
                  ? widget.suffixIcon ?? const SizedBox.shrink()
                  : const Icon(
                      Icons.visibility,
                    ),
            ),
            focusColor: AppColors.primaryColor,
          ),
        ),
      ],
    );
  }
}
