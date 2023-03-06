import 'package:flutter/material.dart';

class TextColorWrap extends StatelessWidget {
  const TextColorWrap(
      {Key? key,
      required this.text,
      required this.textColor,
      required this.textfontSize,
      required this.color})
      : super(key: key);
  final String text;
  final double textfontSize;
  final Color textColor;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(18),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: textfontSize,
          color: textColor,
        ),
      ),
    );
  }
}
