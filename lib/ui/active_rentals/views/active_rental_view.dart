import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart' show SizeExtension;
import 'package:shuttring_hub/common_widget/app_text_form_field.dart';
import 'package:shuttring_hub/common_widget/main_app_bar.dart';
import 'package:shuttring_hub/generated/assets.dart';
import 'package:shuttring_hub/utils/app_color.dart';

import '../../../common_widget/app_text.dart' show AppText, AppTextStyle;
import '../../../utils/string.dart' show Strings;

class ActiveRentalView extends StatefulWidget {
  const ActiveRentalView({super.key});

  @override
  State<ActiveRentalView> createState() => _ActiveRentalViewState();
}

class _ActiveRentalViewState extends State<ActiveRentalView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      appBar: MainAppBar(
        images: Assets.notificationIcon,
        onTap: (){

        },
        title: "Active Rentals",
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            SizedBox(height: 30.h),
            searchField(),
            SizedBox(height: 20.h),
            activeRentals(),
          ],
        ),
      ),
    );
  }

  Widget searchField(){
    return AppTextField(
      borderRadius: 20.r,
      hint: "Search rentals",
      height: 48.h,
      vPadding: 0,
      prefixIconPath: Assets.imageSearchIcon,
      prefixIconUnfocusedColor: AppColors.black,
    );
  }

  Widget activeRentals() {
    return ListView.separated(
      itemCount: 5,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return customWidget(
          name: "Navdeep",
          date: "28 Aug 2026",
          status: "Active",
          rup: "₹470/mo",
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(height: 12.h);
      },
    );
  }

  Widget customWidget({
    required String name,
    required String date,
    required String status,
    required String rup,
}){
    return Container(
      padding: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffE9E5DA),width: 1.5.w),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                text: name,
                fontFamily: Strings.FONT_FAMILY_Manrope,
                style: AppTextStyle.manropeBold,
                textSize: 14.sp,
                color: AppColors.black,
              ),
              AppText(
                text: rup,
                fontFamily: Strings.FONT_FAMILY_Manrope,
                style: AppTextStyle.manropeBold,
                textSize: 14.sp,
                color: AppColors.black,
              ),
            ],
          ),
          SizedBox(height: 5.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                text: date,
                fontFamily: Strings.FONT_FAMILY_Manrope,
                style: AppTextStyle.manropeMedium,
                textSize: 15.sp,
                color: AppColors.secondaryColor,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 2.h),
                decoration: BoxDecoration(
                  color: Color(0xffC0DD97),
                  borderRadius: BorderRadius.circular(10.r)
                ),
                child: AppText(
                  text: status,
                  fontFamily: Strings.FONT_FAMILY_Manrope,
                  style: AppTextStyle.manropeBold,
                  textSize: 13.sp,
                  color: AppColors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
