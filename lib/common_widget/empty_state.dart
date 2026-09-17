import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuttring_hub/common_widget/app_button.dart';
import 'package:shuttring_hub/common_widget/app_text.dart';
import 'package:shuttring_hub/utils/app_color.dart';
import 'package:shuttring_hub/utils/string.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({
    super.key,
    required this.title,
    required this.subtitle,
    this.actionLabel,
    this.onAction,
    this.icon = Icons.inventory_2_outlined,
  });

  final String title;
  final String subtitle;
  final String? actionLabel;
  final VoidCallback? onAction;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 28.h),
      child: Column(
        children: [
          Container(
            height: 64.w,
            width: 64.w,
            decoration: BoxDecoration(
              color: AppColors.mutedSurface,
              borderRadius: BorderRadius.circular(18.r),
            ),
            child: Icon(icon, color: AppColors.themeColor, size: 28.sp),
          ),
          SizedBox(height: 14.h),
          AppText(
            text: title,
            size: 16.sp,
            style: AppTextStyle.manropeBold,
            fontFamily: Strings.FONT_FAMILY_Manrope,
          ),
          SizedBox(height: 6.h),
          AppText(
            text: subtitle,
            size: 13.sp,
            color: AppColors.greyColor,
            textAlign: TextAlign.center,
            fontFamily: Strings.FONT_FAMILY_Manrope,
          ),
          if (actionLabel != null && onAction != null) ...[
            SizedBox(height: 16.h),
            SizedBox(
              width: 180.w,
              child: AppButton(
                text: actionLabel!,
                height: 44.h,
                onPressed: onAction,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class ErrorState extends StatelessWidget {
  const ErrorState({
    super.key,
    this.message = Strings.somethingWentWrong,
    required this.onRetry,
  });

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return EmptyState(
      title: message,
      subtitle: 'Please try again in a moment.',
      actionLabel: Strings.retry,
      onAction: onRetry,
      icon: Icons.error_outline,
    );
  }
}
