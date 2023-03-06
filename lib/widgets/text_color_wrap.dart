import 'package:flutter/material.dart';

class TextColorWrap extends StatelessWidget {
  const TextColorWrap(
      {Key? key,
      required this.text,
      required this.textColor,
      required this.color})
      : super(key: key);
  final String text;
  final Color textColor;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(18),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          color: textColor,
        ),
      ),
    );
  }
}
