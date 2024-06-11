import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;
  final VoidCallback onPressed;
  final double fontSize;
  final EdgeInsets padding;
  final BorderRadius borderRadius;
  final BorderSide border;

  const CustomButton({
    super.key,
    required this.text,
    required this.color,
    required this.onPressed,
    this.fontSize = 16.0,
    this.padding = const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
    this.borderRadius = const BorderRadius.all(Radius.circular(8.0)),
    this.textColor = Colors.white,
    this.border = BorderSide.none,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: padding,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius,
          side: border,
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
            fontSize: fontSize,
            color: textColor
        ),
      ),
    );
  }
}
