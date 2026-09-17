import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart' show SizeExtension;
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/widget_extensions.dart';
import 'package:shuttring_hub/common_widget/app_button.dart';
import 'package:shuttring_hub/common_widget/app_text.dart';
import 'package:shuttring_hub/common_widget/basic_app_bar.dart';
import 'package:shuttring_hub/generated/assets.dart';
import 'package:shuttring_hub/utils/app_color.dart';

import '../../../common_widget/app_text_form_field.dart' show AppTextField;
import '../../../utils/string.dart' show Strings;

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      appBar: BasicAppBar(line: true,
      onTap: (){
        Get.back();
    },),
      body: SingleChildScrollView(
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30.h),
            contentWidget(),
            SizedBox(height: 20.h),
            fields(),
            SizedBox(height: 40.h),
            button(),
          ],
        ),
      )
    );
  }

  Widget contentWidget() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Color(0xfffdf1e2),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Image(
              image: AssetImage(Assets.imageLockCheck),
              fit: BoxFit.cover,
              height: 70.h,
              width: 70.w,
            ),
          ),
        ),
        SizedBox(height: 20.h),
        AppText(
          text: Strings.resetPassword,
          fontFamily: Strings.FONT_FAMILY_Manrope,
          style: AppTextStyle.manropeExtraBold,
          textSize: 24.sp,
          color: AppColors.black,
        ),
        SizedBox(height: 7.h),
        AppText(
          textAlign: TextAlign.center,
          text: Strings.newPassword,
          fontFamily: Strings.FONT_FAMILY_Manrope,
          style: AppTextStyle.manropeMedium,
          textSize: 15.sp,
          color: AppColors.greyColor,
        ).paddingSymmetric(horizontal: 12),
      ],
    );
  }

  Widget fields() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          text: Strings.newPasswordField,
          fontFamily: Strings.FONT_FAMILY_Manrope,
          style: AppTextStyle.manropeSemiBold,
          textSize: 15.sp,
          color: AppColors.black,
        ),
        SizedBox(height: 5.h),
        AppTextField(
          borderRadius: 20.r,
          hPadding: EdgeInsets.symmetric(
            horizontal: 4.w,
            vertical: 10.h,
          ),
          hint: "New password",
          prefixIconPath: Assets.mailIcon,
          prefixIconUnfocusedColor: AppColors.black,
        ),
        SizedBox(height: 20.h),
        AppText(
          text: Strings.confirm,
          fontFamily: Strings.FONT_FAMILY_Manrope,
          style: AppTextStyle.manropeSemiBold,
          textSize: 15.sp,
          color: AppColors.black,
        ),
        SizedBox(height: 5.h),
        AppTextField(
          borderRadius: 20.r,
          hPadding: EdgeInsets.symmetric(
            horizontal: 4.w,
            vertical: 10.h,
          ),
          hint: "Confirm password",
          prefixIconPath: Assets.passwordIcon,
          prefixIconUnfocusedColor: AppColors.black,
        ),
      ],
    ).paddingSymmetric(horizontal: 21.w, vertical: 12.h);
  }

  Widget button() {
    return AppButton(
      text: Strings.resetPassword,
      buttonColor: AppColors.black,
      onPressed: () {},
    ).paddingSymmetric(horizontal: 21);
  }
}
