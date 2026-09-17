import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart' show SizeExtension;
import 'package:get/get.dart';
import 'package:shuttring_hub/common_widget/app_button.dart';
import 'package:shuttring_hub/common_widget/app_text.dart';
import 'package:shuttring_hub/common_widget/app_text_form_field.dart';
import 'package:shuttring_hub/common_widget/basic_app_bar.dart';
import 'package:shuttring_hub/generated/assets.dart';
import 'package:shuttring_hub/utils/app_color.dart';
import 'package:shuttring_hub/utils/app_routes.dart';
import 'package:shuttring_hub/utils/string.dart';
import 'package:dotted_border/dotted_border.dart';


class RentalView extends StatefulWidget {
  const RentalView({super.key});

  @override
  State<RentalView> createState() => _RentalViewState();
}

class _RentalViewState extends State<RentalView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      appBar: BasicAppBar(
        line: true,
        title: Strings.newRental,
        onTap: () {
          Get.back();
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 15.h),
                searchField(),
                SizedBox(height: 10.h),
                rentalCustomers(),
              ],
            ),
            ),
            nextButton(),
            SizedBox(height: 35.h),
          ],
        )
      ),
    );
  }

  Widget searchField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      AppTextField(
      height: 48.h,
      vPadding: 0,
      borderRadius: 20.r,
      hint: "Search customer",
      prefixIconPath: Assets.imageSearchIcon,
      prefixIconUnfocusedColor: AppColors.black,
      ),
        SizedBox(height: 15.h),
        GestureDetector(
          onTap: (){
            Get.toNamed(AppRoutes.rentalAddCustomer);
          },
          child:DottedBorder(
            options: RoundedRectDottedBorderOptions(
              color: const Color(0xffE9E5DA),
              strokeWidth: 1.5.w,
              dashPattern: const [6, 4],
              radius: Radius.circular(16.r),
            ),
            child: Container(
              padding: EdgeInsets.all(12.w),
              width: Get.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage(Assets.imagePlusIcon),
                      height: 16.h,
                      width: 16.w,
                    ),
                    SizedBox(width: 6.w),
                    AppText(
                      text: Strings.addNewCustomer,
                      fontFamily: Strings.FONT_FAMILY_Manrope,
                      style: AppTextStyle.manropeBold,
                      textSize: 15.sp,
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  void _showAddCustomerBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
            decoration: BoxDecoration(
              color: AppColors.appBackgroundColor,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 40.w,
                    height: 4.h,
                    margin: EdgeInsets.only(bottom: 16.h),
                    decoration: BoxDecoration(
                      color: AppColors.black.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                ),
                AppText(
                  text: "Add Customer",
                  fontFamily: Strings.FONT_FAMILY_Manrope,
                  style: AppTextStyle.manropeBold,
                  textSize: 18.sp,
                  color: AppColors.black,
                ),
                SizedBox(height: 16.h),
                AppText(
                  text: "Customer name",
                  fontFamily: Strings.FONT_FAMILY_Manrope,
                  style: AppTextStyle.manropeSemiBold,
                  textSize: 14.sp,
                  color: AppColors.black,
                ),
                SizedBox(height: 10.h),
                AppTextField(
                  borderRadius: 20.r,
                  hint: "Customer Name",
                ),
                SizedBox(height: 12.h),
                AppText(
                  text: "Phone number",
                  fontFamily: Strings.FONT_FAMILY_Manrope,
                  style: AppTextStyle.manropeSemiBold,
                  textSize: 14.sp,
                  color: AppColors.black,
                ),
                SizedBox(height: 10.h),
                AppTextField(
                  borderRadius: 20.r,
                  hint: "Phone Number",
                 // keyboardType: TextInputType.phone,
                ),
                SizedBox(height: 24.h),
                AppButton(
                  text: "Add Customer",
                  buttonColor: AppColors.black,
                  onPressed: () {

                  },
                ),
                SizedBox(height: 10.h),
              ],
            ),
          ),
        );
      },
    );
  }
  Widget rentalCustomers() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 6,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 8.h),
            custom(
              title: "Rk",
              customerName: "Navdeep",
              phoneNumber: "2314323123",
              status: "Active",
            ),
          ],
        );
      },
    );
  }

  Widget nextButton(){
    return AppButton(text:"Next",
    buttonColor: AppColors.black,
    onPressed: (){
      Get.toNamed(AppRoutes.selectMaterialView);
    },
    );
  }

  Widget custom({
    required String title,
    required String customerName,
    required String phoneNumber,
    required String status,
  }) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: const Color(0xffE9E5DA), width: 1.5.w),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 36.w,
            height: 36.w,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xffFBE6DD),
            ),
            child: Center(
              child: AppText(
                text: title,
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: AppText(
                        text: customerName,
                        style: AppTextStyle.manropeMedium,
                        fontFamily: Strings.FONT_FAMILY_Manrope,
                        textSize: 13.sp,
                        color: AppColors.black,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 7.w,
                        vertical: 4.h,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xffC0DD97),
                        borderRadius: BorderRadius.circular(9.r),
                      ),
                      child: AppText(
                        text: status,
                        style: AppTextStyle.manropeMedium,
                        fontFamily: Strings.FONT_FAMILY_Manrope,
                        textSize: 11.sp,
                        color: AppColors.black,
                      ),
                    ),
                  ],
                ),
                AppText(
                  text: phoneNumber,
                  style: AppTextStyle.manropeMedium,
                  fontFamily: Strings.FONT_FAMILY_Manrope,
                  textSize: 12.sp,
                  color: AppColors.black,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
