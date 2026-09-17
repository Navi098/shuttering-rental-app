import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart' show SizeExtension;
import 'package:get/get.dart';
import 'package:shuttring_hub/common_widget/app_button.dart';
import 'package:shuttring_hub/common_widget/app_text.dart';
import 'package:shuttring_hub/common_widget/app_text_form_field.dart';
import 'package:shuttring_hub/generated/assets.dart';
import '../../../common_widget/basic_app_bar.dart' show BasicAppBar;
import '../../../utils/app_color.dart' show AppColors;
import '../../../utils/string.dart' show Strings;

class RentalAddCustomerView extends StatefulWidget {
  const RentalAddCustomerView({super.key});

  @override
  State<RentalAddCustomerView> createState() => _RentalAddCustomerViewState();
}

class _RentalAddCustomerViewState extends State<RentalAddCustomerView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      appBar: BasicAppBar(
        line: true,
        title: Strings.addNewCustomer,
        onTap: () {
          Get.back();
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              addCustomerFields()
            ],
          ),
          ),
          saveButton(),
          SizedBox(height: 32.h),
        ],
      ).paddingSymmetric(horizontal: 20.w,vertical: 20.h)
    );
  }

  Widget addCustomerFields() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(32.sp),
          width: Get.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.greyColor, width: 1.2.w),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Color(0xffE9E5DA),
                  shape: BoxShape.circle,
                ),
               child: Center(
                 child: Image(
                   image: AssetImage(Assets.imageCamera),
                   height: 30.h,
                   width: 30.w,
                   fit: BoxFit.contain,
                 ),
               ),
              ),
              SizedBox(height: 9.h),
              AppText(
                text: Strings.tapToUploadPhoto,
                style: AppTextStyle.manropeMedium,
                fontFamily: Strings.FONT_FAMILY_Manrope,
                textSize: 12.sp,
                color: Colors.grey,
              ),
            ],
          ),
        ),
        SizedBox(height: 15.h),
        AppText(
          text: Strings.fullName,
          style: AppTextStyle.manropeSemiBold,
          fontFamily: Strings.FONT_FAMILY_Manrope,
          textSize: 15.sp,
        ),
        SizedBox(height: 5.h),
        AppTextField(

        ),
        SizedBox(height: 10.h),
        AppText(
          text: Strings.phoneNumber,
          style: AppTextStyle.manropeSemiBold,
          fontFamily: Strings.FONT_FAMILY_Manrope,
          textSize: 15.sp,
        ),
        SizedBox(height: 5.h),
        AppTextField(

        ),
        SizedBox(height: 15.h),
        AppText(
          text: "Village",
          style: AppTextStyle.manropeSemiBold,
          fontFamily: Strings.FONT_FAMILY_Manrope,
          textSize: 15.sp,
        ),
        SizedBox(height: 5.h),
        AppTextField(

        ),
      ],
    );
  }
  Widget saveButton(){
    return AppButton(
      text: "Save & Select",
      buttonColor: AppColors.black,
      onPressed: (){

      },
    );
  }
}
