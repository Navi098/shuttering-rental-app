import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart' show SizeExtension;
import 'package:get/get.dart';
import 'package:shuttring_hub/common_widget/app_text.dart';
import 'package:shuttring_hub/utils/app_color.dart';
import 'package:shuttring_hub/utils/app_routes.dart';
import 'package:shuttring_hub/utils/string.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final AppTextStyle? style;
  final String? images;
  final VoidCallback? onTap;

  const MainAppBar({
    this.style,
    this.title,
    this.images,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: (){
            Get.toNamed(AppRoutes.profileView);
          },
          child: Container(
            width: 36.w,
            height: 36.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.black,
            ),
            child: Center(
              child: AppText(
                text: "N",
                style: AppTextStyle.manropeMedium,
                fontFamily: Strings.FONT_FAMILY_Manrope,
                textSize: 13.sp,
                color: AppColors.whiteColor,
              ),
            ),
          ),
        ),
        AppText(
          text: title ?? "",
          textSize: 17.sp,
          fontFamily: Strings.FONT_FAMILY_Manrope,
          style: AppTextStyle.manropeBold,
        ),
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.all(4.r),
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              border: Border.all(color: Color(0xffE9E5DA),width: 1.5.w),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: images != null
                ? Image.asset(
              images!,
              width: 25.w,
              height: 25.h,
              fit: BoxFit.contain,
            )
                : const SizedBox(),
          ),
        ),
      ],
    ).marginOnly(left: 20.w,top: 50.h,right: 20.w);
  }
  @override
  Size get preferredSize => Size.fromHeight(Platform.isIOS ? 85.h : 55.h);
}