import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shuttring_hub/utils/app_color.dart';

import 'app_text.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color? buttonColor;
  final Color? textColor;
  final double? width;
  final double? height;
  final double? borderRadius;
  final double? fontSize;

  const AppButton({
    super.key,
    required this.text,
    this.onPressed,
    this.buttonColor,
    this.textColor,
    this.width,
    this.height,
    this.borderRadius,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width ?? double.infinity,
        height: height ?? 56.h,
        decoration: BoxDecoration(
          color: buttonColor ?? AppColors.splashBackground,
          borderRadius: BorderRadius.circular(
            borderRadius ?? 17.r,
          ),
        ),
        child: Center(
          child: AppText(
            text: text.tr,
            textSize: fontSize ?? 16.sp,
            color: textColor ?? Colors.white,
            style: AppTextStyle.manropeBold,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}