import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart' show SizeExtension;
import 'package:get/get.dart';
import 'package:shuttring_hub/common_widget/app_button.dart';
import 'package:shuttring_hub/common_widget/app_text.dart';
import 'package:shuttring_hub/common_widget/basic_app_bar.dart';
import 'package:shuttring_hub/generated/assets.dart';
import 'package:shuttring_hub/utils/app_color.dart';
import 'package:shuttring_hub/utils/string.dart';

class RentalShowMaterial extends StatefulWidget {
  const RentalShowMaterial({super.key});

  @override
  State<RentalShowMaterial> createState() => _RentalShowMaterialState();
}

class _RentalShowMaterialState extends State<RentalShowMaterial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      appBar: BasicAppBar(title: "Details", onTap: () {
        Get.back();
      },
      line: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  detailsShowWidget(),
                  SizedBox(height: 20.h),
                  dateWidget(),
                  SizedBox(height: 20.h),
                  selectedMaterial(),
                ],
              ),
            ),
            createRental(),
            SizedBox(height: 35.h),
          ],
        ),
      ),
    );
  }

  Widget detailsShowWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(20.w),
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: const Color(0xffE9E5DA), width: 1.5.w),
          ),
          child: Row(
            children: [
              Container(
                width: 50.w,
                height: 50.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xffFBE6DD),
                ),
                child: Center(
                  child: AppText(
                    text: "AS",
                    style: AppTextStyle.manropeMedium,
                    fontFamily: Strings.FONT_FAMILY_Manrope,
                    textSize: 13.sp,
                    color: AppColors.black,
                  ),
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      text: "Navdeep",
                      style: AppTextStyle.manropeSemiBold,
                      fontFamily: Strings.FONT_FAMILY_Manrope,
                      textSize: 13.sp,
                      color: AppColors.black,
                    ),
                    AppText(
                      text: "3423423424",
                      style: AppTextStyle.manropeMedium,
                      fontFamily: Strings.FONT_FAMILY_Manrope,
                      textSize: 13.sp,
                      color: AppColors.greyColor,
                    ),
                  ],
                ),
              ),
              AppText(
                text: "Change",
                style: AppTextStyle.manropeMedium,
                fontFamily: Strings.FONT_FAMILY_Manrope,
                textSize: 13.sp,
                color: AppColors.greyColor,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget dateWidget() {
    return Container(
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: const Color(0xffE9E5DA), width: 1.5.w),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image(
            image: AssetImage(Assets.calenderIcon),
            height: 22.h,
            width: 22.w,
          ),
          SizedBox(width: 5.w),
          Expanded(
            child: AppText(
              text: Strings.startDate,
              style: AppTextStyle.manropeMedium,
              fontFamily: Strings.FONT_FAMILY_Manrope,
              textSize: 13.sp,
              color: AppColors.greyColor,
            ),
          ),
          AppText(
            text: "29 Aug 2025",
            style: AppTextStyle.manropeBold,
            fontFamily: Strings.FONT_FAMILY_Manrope,
            textSize: 14.sp,
            color: AppColors.black,
          ),
        ],
      ),
    );
  }

  Widget selectedMaterial(){
    return Container(
     // padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: const Color(0xffE9E5DA), width: 1.5.w),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              AppText(
                text: "Selected Materials",
                style: AppTextStyle.manropeBold,
                fontFamily: Strings.FONT_FAMILY_Manrope,
                textSize: 14.sp,
                color: AppColors.greyColor,
              ),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AppText(
                    text: "Bamboo",
                    style: AppTextStyle.manropeMedium,
                    fontFamily: Strings.FONT_FAMILY_Manrope,
                    textSize: 14.sp,
                    color: AppColors.black,
                  ),
                  SizedBox(width: 5.w),
                  Expanded(child: AppText(
                    text: "3 pcs",
                    style: AppTextStyle.manropeMedium,
                    fontFamily: Strings.FONT_FAMILY_Manrope,
                    textSize: 14.sp,
                    color: AppColors.greyColor,
                  ), ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AppText(
                        text: "₹5",
                        style: AppTextStyle.manropeMedium,
                        fontFamily: Strings.FONT_FAMILY_Manrope,
                        textSize: 14.sp,
                        color: AppColors.greyColor,
                      ),
                      SizedBox(width: 6.w),
                      AppText(
                        text: "→",
                        style: AppTextStyle.manropeMedium,
                        fontFamily: Strings.FONT_FAMILY_Manrope,
                        textSize: 14.sp,
                        color: AppColors.greyColor,
                      ),
                      SizedBox(width: 6.w),
                      AppText(
                        text: "₹15",
                        style: AppTextStyle.manropeMedium,
                        fontFamily: Strings.FONT_FAMILY_Manrope,
                        textSize: 14.sp,
                        color: AppColors.greyColor,
                      ),
                    ],
                  )
                ],
              ),
            ],),
          ),
          SizedBox(height:10.h),
          Container(
            height: 1.h,
            width: Get.width,
            color: Color(0xffE9E5DA),
          ),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                text: "Daily Rent Total",
                style: AppTextStyle.manropeMedium,
                fontFamily: Strings.FONT_FAMILY_Manrope,
                textSize: 14.sp,
                color: AppColors.greyColor,
              ),
              AppText(
                text: "₹15",
                style: AppTextStyle.manropeMedium,
                fontFamily: Strings.FONT_FAMILY_Manrope,
                textSize: 14.sp,
                color: AppColors.greyColor,
              ),
            ],
          ).paddingSymmetric(horizontal: 15,vertical: 10),
        ],
      ),
    );
  }

  Widget createRental() {
    return AppButton(
      text: "Create rental",
      buttonColor: AppColors.black,
      onPressed: () {},
    );
  }
}
