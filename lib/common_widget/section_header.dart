import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuttring_hub/common_widget/app_text.dart';
import 'package:shuttring_hub/utils/app_color.dart';
import 'package:shuttring_hub/utils/string.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.title,
    this.actionLabel = Strings.viewAll,
    this.onAction,
  });

  final String title;
  final String actionLabel;
  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 10.h),
      child: Row(
        children: [
          Expanded(
            child: AppText(
              text: title,
              size: 18.sp,
              style: AppTextStyle.manropeBold,
              fontFamily: Strings.FONT_FAMILY_Manrope,
            ),
          ),
          if (onAction != null)
            GestureDetector(
              onTap: onAction,
              child: AppText(
                text: actionLabel,
                size: 13.sp,
                color: AppColors.themeColor,
                style: AppTextStyle.manropeSemiBold,
                fontFamily: Strings.FONT_FAMILY_Manrope,
              ),
            ),
        ],
      ),
    );
  }
}
