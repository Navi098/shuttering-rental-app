import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart' show SizeExtension;
import 'package:get/get.dart';
import 'package:shuttring_hub/common_widget/app_text.dart';
import 'package:shuttring_hub/common_widget/app_text_form_field.dart';
import 'package:shuttring_hub/common_widget/main_app_bar.dart';
import 'package:shuttring_hub/generated/assets.dart' show Assets;
import 'package:shuttring_hub/utils/app_color.dart';
import 'package:shuttring_hub/utils/app_routes.dart';
import 'package:shuttring_hub/utils/string.dart';

class CustomerView extends StatefulWidget {
  const CustomerView({super.key});
  @override
  State<CustomerView> createState() => _CustomerViewState();
}

class _CustomerViewState extends State<CustomerView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      appBar: MainAppBar(
        images: Assets.notificationIcon,
        title: Strings.customer,
        onTap: (){

        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            SizedBox(height: 10.h),
            searchField(),
            SizedBox(height: 20.h),
            customerList(),
          ],
        ),
      ),
    );
  }

  Widget searchField(){
    return AppTextField(
      borderRadius: 20.r,
      hint: Strings.searchCustomer,
      height: 48.h,
      vPadding: 0,
      prefixIconPath: Assets.imageSearchIcon,
      prefixIconUnfocusedColor: AppColors.black,
    );
  }

  Widget customerList(){
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 6,
      itemBuilder: (context,index){
        return Column(
          children: [
            GestureDetector(
              onTap: (){
                Get.toNamed(AppRoutes.customerDetailsView);
              },
              child: customWidget(
                title: "Navdeep",
                date: "20-2-2026",
                rupee: 200,
                status: "Active",
              ),
            ),
            SizedBox(height: 10.h),
          ],
        );
      }
    );
  }

  Widget customWidget({
    required String title,
    required String date,
    required int rupee,
    required String status,
  }) {
    return Container(
      padding: EdgeInsets.all(10),
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
