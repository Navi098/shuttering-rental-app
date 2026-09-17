import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/widget_extensions.dart';
import 'package:shuttring_hub/common_widget/app_text.dart';
import 'package:shuttring_hub/generated/assets.dart';
import 'package:shuttring_hub/utils/app_color.dart';
import 'package:shuttring_hub/utils/string.dart';

class BasicAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String? title;
  final VoidCallback? onTap;
  final bool line;

  const BasicAppBar({
    this.title,
    this.onTap,
    this.line = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
       children: [
      Padding(
        padding: EdgeInsets.only(
          left: 20.w,
          right: 20.w,
          top: 50.h,
          bottom: 12.h,
        ),
        child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: onTap,
            child:  Container(
              padding: EdgeInsets.all(7.w),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.whiteColor,
                border: Border.all(color: Color(0xffE9E5DA),width: 1.5.w),
                // borderRadius: BorderRadius.circular(8.r),
              ),
              child: Center(
                child: Image(image: AssetImage(Assets.imageBackIcon),
                  height: 20.h,
                  width: 20.w,
                  color: AppColors.black,
                ),
              ),
            ),
          ),
          AppText(text: title ??"",
            style: AppTextStyle.manropeBold,
            fontFamily: Strings.FONT_FAMILY_Manrope,
            textSize: 17.sp,
            color: AppColors.black,
          ),
          SizedBox(
            width: 48.w,
          ),
        ],
         ),
      ),
         if(line)
         Container(
           height: 1.h,
           width: Get.width,
           color: Color(0xffE9E5DA)
         ),  
       ],
    );
  }
  @override
  Size get preferredSize => Size.fromHeight(Platform.isAndroid ? 95.h : 90.h);
}