import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/spacing.dart';

class AppIconTextButton extends StatelessWidget {
  final double? borderRadius;
  final Color? backgroundColor;
  final Color? imgColor;
  final double? horizontalPadding;
  final double? verticalPadding;
  final double? buttonWidth;
  final double? imgHeight;
  final double? imgWidth;
  final double? buttonHeight;
  final String buttonText;
  final TextStyle textStyle;
  final VoidCallback onPressed;
  final String img;

  const AppIconTextButton({
    super.key,
    required this.img,
    this.borderRadius,
    this.backgroundColor,
    this.imgHeight,
    this.imgWidth,
    this.imgColor,
    this.horizontalPadding,
    this.verticalPadding,
    this.buttonHeight,
    this.buttonWidth,
    required this.buttonText,
    required this.textStyle,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 16.0),
              side: const BorderSide(color: Color(0xFFF4F5F6))),
        ),
        backgroundColor: MaterialStatePropertyAll(
          backgroundColor ?? Colors.transparent,
        ),
        padding: MaterialStateProperty.all<EdgeInsets>(
          EdgeInsets.symmetric(
            horizontal: 12.w,
            vertical: 14.h,
          ),
        ),
        fixedSize: MaterialStateProperty.all(
          Size(buttonWidth ?? double.maxFinite, buttonHeight ?? 56.h),
        ),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            img,
            color: imgColor,
            height: imgHeight,
            width: imgWidth,
          ),
          horizontalSpace(10.w),
          Text(
            buttonText,
            style: textStyle,
          ),
        ],
      ),
    );
  }
}
