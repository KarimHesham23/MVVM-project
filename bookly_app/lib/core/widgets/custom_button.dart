import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.backgroundColor,
    this.fontSize,
    this.fontWeigth,
    this.borderReduis,
    this.textColor,
  });
  final VoidCallback onPressed;
  final String text;
  final Color? backgroundColor;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeigth;
  final BorderRadiusGeometry? borderReduis;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(
        style: TextButton.styleFrom(
            backgroundColor: backgroundColor ?? Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: borderReduis ??
                  const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    bottomLeft: Radius.circular(16),
                  ),
            )),
        onPressed: onPressed,
        child: Text(
          text,
          style: Styles.textStyle20.copyWith(
            fontSize: fontSize,
            fontWeight: fontWeigth,
            color: textColor ?? Colors.black,
          ),
        ),
      ),
    );
  }
}
