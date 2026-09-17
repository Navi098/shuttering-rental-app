import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart' show SizeExtension;
import 'package:get/get.dart';
import 'package:shuttring_hub/common_widget/app_button.dart';
import 'package:shuttring_hub/common_widget/basic_app_bar.dart';
import 'package:shuttring_hub/generated/assets.dart';
import 'package:shuttring_hub/utils/app_color.dart';

import '../../../common_widget/app_text.dart' show AppText, AppTextStyle;
import '../../../common_widget/app_text_form_field.dart' show AppTextField;
import '../../../utils/string.dart' show Strings;

class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      appBar: BasicAppBar(
        line: true,
        onTap: () {
          Get.back();
        },
        title: "Edit Profile",
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20.h),
                profileView(),
                SizedBox(height: 16.h),
                editProfileField(),
              ],
            ),
          ),
          button(),
          SizedBox(height: 50.h),
        ],
      ),
    );
  }

  Widget profileView() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: EdgeInsets.all(9.w),
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0xffE9E5DA),
              width: 1.5.w,
            ),
            shape: BoxShape.circle,
          ),
          child: ClipOval(
            child: Image(
              image: AssetImage(Assets.imageMan),
              height: 90.h,
              width: 90.w,
              fit: BoxFit.cover,
            ),
          ),
        ),

        Positioned(
          right: 0,
          bottom: 0,
          child: Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white,
                width: 2.w,
              ),
            ),
            child: Icon(
              Icons.camera_alt,
              color: Colors.white,
              size: 18.sp,
            ),
          ),
        ),
      ],
    );
  }

  Widget editProfileField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          text: Strings.fullName,
          fontFamily: Strings.FONT_FAMILY_Manrope,
          style: AppTextStyle.manropeSemiBold,
          textSize: 15.sp,
          color: AppColors.black,
        ),
        SizedBox(height: 5.h),
        AppTextField(
          hint: "Enter a name",
          prefixIconPath: Assets.mailIcon,
          prefixIconUnfocusedColor: AppColors.black,
        ),
        SizedBox(height: 15.h),
        AppText(
          text: Strings.email,
          fontFamily: Strings.FONT_FAMILY_Manrope,
          style: AppTextStyle.manropeSemiBold,
          textSize: 15.sp,
          color: AppColors.black,
        ),
        SizedBox(height: 5.h),
        AppTextField(
          hint: "Enter a email",
          prefixIconPath: Assets.mailIcon,
          prefixIconUnfocusedColor: AppColors.black,
        ),
        SizedBox(height: 15.h),
        AppText(
          text: Strings.businessName,
          fontFamily: Strings.FONT_FAMILY_Manrope,
          style: AppTextStyle.manropeSemiBold,
          textSize: 15.sp,
          color: AppColors.black,
        ),
        SizedBox(height: 5.h),
        AppTextField(
          hint: "Enter a business name",
          prefixIconPath: Assets.mailIcon,
          prefixIconUnfocusedColor: AppColors.black,
        ),
        SizedBox(height: 15.h),
        AppText(
          text: Strings.businessAddress,
          fontFamily: Strings.FONT_FAMILY_Manrope,
          style: AppTextStyle.manropeSemiBold,
          textSize: 15.sp,
          color: AppColors.black,
        ),
        SizedBox(height: 5.h),
        AppTextField(
          hint: "Enter a business address",
          prefixIconPath: Assets.mailIcon,
          prefixIconUnfocusedColor: AppColors.black,
        ),
      ],
    ).paddingSymmetric(horizontal: 21.w);
  }

  Widget button() {
    return AppButton(
      text: "Save changes",
      buttonColor: AppColors.black,
      onPressed: () {},
    ).paddingSymmetric(horizontal: 20.w);
  }
}
