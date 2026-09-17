import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart' show SizeExtension;
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:shuttring_hub/common_widget/app_button.dart';
import 'package:shuttring_hub/common_widget/app_text.dart';
import 'package:shuttring_hub/common_widget/main_app_bar.dart';
import 'package:shuttring_hub/generated/assets.dart';
import 'package:shuttring_hub/utils/app_color.dart';
import 'package:shuttring_hub/utils/app_routes.dart';
import 'package:shuttring_hub/utils/string.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      appBar: MainAppBar(
        title: Strings.shuttering,
        images: Assets.notificationIcon,
        onTap: () {
          Get.toNamed(AppRoutes.notificationView);
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              contentView(),
              SizedBox(height: 10.h),
              boxes(),
              SizedBox(height: 12.h),
              rentalAddButton(),
              SizedBox(height: 12.h),
              viewAll(),
              SizedBox(height: 10.h,),
              listView(),
            ],
          ),
        )
      ),
    );
  }

  Widget contentView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          text: Strings.navdeep,
          fontFamily: Strings.FONT_FAMILY_Manrope,
          style: AppTextStyle.manropeExtraBold,
          textSize: 20.sp,
          color: AppColors.black,
        ),
        SizedBox(height: 2.h),
        AppText(
          text: Strings.date,
          fontFamily: Strings.FONT_FAMILY_Manrope,
          style: AppTextStyle.manropeSemiBold,
          textSize: 13.sp,
          color: AppColors.secondaryColor,
        ),
      ],
    );
  }

  Widget boxes() {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 10.w,
      mainAxisSpacing: 10.h,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: 1.25,
      children: [
        boxesWidget(
          image: Assets.rentalsIcon,
          title: "Active rentals",
          value: "12",
          color: Color(0xffffe8df),
        ),
        boxesWidget(
          image: Assets.returnIcon,
          title: "Returns today",
          value: "3",
          color: Color(0xffE9E5DA),
        ),
        boxesWidget(
          image: Assets.pendingIcon,
          title: "Pending payments",
          value: "₹18,500",
          color: Color(0xffDFF3EC),
        ),
        boxesWidget(
          image: Assets.customerIcon,
          title: "Total customers",
          value: "56",
          color: Color(0xffE9ECEF),
        ),
      ],
    );
  }

  Widget boxesWidget({
    required String image,
    required String title,
    required String value,
    required Color color,
  }) {
    return Container(
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: Color(0xffE9E5DA),width: 1.5.w),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(7.r),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Image.asset(image, width: 22.r, height: 22.r),
          ),
          SizedBox(height: 16.h),
          AppText(
            text: title,
            fontFamily: Strings.FONT_FAMILY_Manrope,
            style: AppTextStyle.manropeSemiBold,
            textSize: 13.sp,
            color: AppColors.secondaryColor,
          ),
          SizedBox(height: 5.h),
          AppText(
            text: value,
            fontFamily: Strings.FONT_FAMILY_Manrope,
            style: AppTextStyle.manropeSemiBold,
            textSize: 13.sp,
            color: AppColors.secondaryColor,
          ),
        ],
      ),
    );
  }

  Widget rentalAddButton() {
    return AppButton(
      text: Strings.newRental,
      buttonColor: AppColors.black,
      height: 52.h,
      onPressed: () {
        Get.toNamed(AppRoutes.rentalView);
      },
    );
  }

  Widget viewAll(){
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             AppText(
               text: Strings.recentRentals,
               fontFamily: Strings.FONT_FAMILY_Manrope,
               style: AppTextStyle.manropeBold,
               textSize: 15.sp,
               color: AppColors.secondaryColor,
             ),
             AppText(
               text: Strings.viewAll,
               fontFamily: Strings.FONT_FAMILY_Manrope,
               style: AppTextStyle.manropeSemiBold,
               textSize: 13.sp,
               color: Colors.red,
             ),
          ],
        ),
      ],
    );
  }

  Widget listView(){
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 2,
      itemBuilder: (context,index){
        return Column(
          children: [
          customWidget(
          title: "Navdeep",
          date: "20-2-2026",
          rupee: 200,
          status: "Active",
            ),
            SizedBox(height: 10.h),
          ],
        );
      },
    );
  }

  Widget customWidget({
    required String title,
    required String date,
    required int rupee,
    required String status,
  }) {
    return Container(
      padding: EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color:Color(0xffE9E5DA),
          width: 1.5.w,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 36.w,
            height: 36.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xffFBE6DD)
            ),
            child: Center(
              child: AppText(
                text: "Rk",
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: AppText(
                        text: title,
                        fontFamily: Strings.FONT_FAMILY_Manrope,
                        style: AppTextStyle.manropeSemiBold,
                        textSize: 13.sp,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 10.w),
                    AppText(
                      text: "₹$rupee",
                      fontFamily: Strings.FONT_FAMILY_Manrope,
                      style: AppTextStyle.manropeSemiBold,
                      textSize: 13.sp,
                      color: AppColors.black,
                    ),
                  ],
                ),
                SizedBox(height: 5.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: AppText(
                        text: date,
                        fontFamily: Strings.FONT_FAMILY_Manrope,
                        style: AppTextStyle.manropeSemiBold,
                        textSize: 13.sp,
                        color: AppColors.greyColor,
                      ),
                    ),
                    SizedBox(width: 10.w),
                    AppText(
                      text: status,
                      fontFamily: Strings.FONT_FAMILY_Manrope,
                      style: AppTextStyle.manropeSemiBold,
                      textSize: 13.sp,
                      color: Colors.red,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
