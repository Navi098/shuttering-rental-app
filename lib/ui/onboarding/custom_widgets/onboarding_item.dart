import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuttring_hub/common_widget/app_text.dart';
import 'package:shuttring_hub/utils/string.dart';

class OnboardingItem extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  const OnboardingItem({
    super.key,
  required this.image,
  required this.description,
  required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(image,
        height: 250.h,
        width: 250.w,
        ),
        SizedBox(height: 20.h),
        AppText(text: title,
        style: AppTextStyle.manropeSemiBold,
        fontFamily: Strings.FONT_FAMILY_Manrope,
        textSize: 16.sp,
        ),
        SizedBox(height: 10.h),
        AppText(text: description,
          style: AppTextStyle.manropeMedium,
          fontFamily: Strings.FONT_FAMILY_Manrope,
          textSize: 14.sp,
        ),
      ],
    );
  }
}
