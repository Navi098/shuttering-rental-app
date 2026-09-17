import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shuttring_hub/common_widget/app_button.dart';
import 'package:shuttring_hub/common_widget/app_text.dart';
import 'package:shuttring_hub/common_widget/app_text_form_field.dart';
import 'package:shuttring_hub/generated/assets.dart';
import 'package:shuttring_hub/ui/auth/controller/sign_up_controller.dart';
import 'package:shuttring_hub/utils/app_color.dart';
import 'package:shuttring_hub/utils/app_routes.dart';
import 'package:shuttring_hub/utils/string.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
               // SizedBox(height: 20.h),
                topView(),
                SizedBox(height: 10.h),
                textFields(),
                SizedBox(height: 30.h),
                button(),
              ],
            ),
          )
      ),
    );
  }

  Widget topView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(image: AssetImage(Assets.imageLoginLogo), fit: BoxFit.contain,
        ),
        AppText(
          text: Strings.createAccount,
          fontFamily: Strings.FONT_FAMILY_Manrope,
          style: AppTextStyle.manropeExtraBold,
          textSize: 24.sp,
          color: AppColors.black,
        ),
        SizedBox(height: 7.h),
        AppText(
          text: Strings.started,
          fontFamily: Strings.FONT_FAMILY_Manrope,
          style: AppTextStyle.manropeMedium,
          textSize: 15.sp,
          color: AppColors.greyColor,
        ),
      ],
    );
  }

  Widget textFields() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          text: Strings.name,
          fontFamily: Strings.FONT_FAMILY_Manrope,
          style: AppTextStyle.manropeSemiBold,
          textSize: 15.sp,
          color: AppColors.black,
        ),
        SizedBox(height: 5.h),
        AppTextField(
          controller: controller.nameController,
          borderRadius: 20.r,
          hPadding: EdgeInsets.symmetric(
            horizontal: 4.w,
            vertical: 10.h,
          ),
          hint: "Name",
          prefixIconPath: Assets.addCustomer,
          prefixIconUnfocusedColor: AppColors.black,
        ),
        SizedBox(height: 15.h),
        AppText(text: Strings.phoneNumber,
          fontFamily: Strings.FONT_FAMILY_Manrope,
          style: AppTextStyle.manropeSemiBold,
          textSize: 15.sp,
          color: AppColors.black,
        ),
        SizedBox(height: 5.h),
        AppTextField(
          controller: controller.phoneController,
          borderRadius: 20.r,
          hPadding: EdgeInsets.symmetric(
            horizontal: 4.w,
            vertical: 10.h,
          ),
          hint: "Phone number",
          prefixIconPath: Assets.phoneIcon,
          prefixIconUnfocusedColor: AppColors.black,
        ),
        SizedBox(height: 15.h),
        AppText(
          text: Strings.password,
          fontFamily: Strings.FONT_FAMILY_Manrope,
          style: AppTextStyle.manropeSemiBold,
          textSize: 15.sp,
          color: AppColors.black,
        ),
            SizedBox(height: 5.h),
            AppTextField(
              controller: controller.passwordController,
              borderRadius: 20.r,
              hPadding: EdgeInsets.symmetric(
                horizontal: 4.w,
                vertical: 10.h,
              ),
              hint: "Password",
              prefixIconPath: Assets.passwordIcon,
              prefixIconUnfocusedColor: AppColors.black,
        ),
        SizedBox(height: 15.h),
        AppText(
          text: Strings.confirm,
          fontFamily: Strings.FONT_FAMILY_Manrope,
          style: AppTextStyle.manropeSemiBold,
          textSize: 15.sp,
          color: AppColors.black,
        ),
        SizedBox(height: 5.h),
        AppTextField(
          controller: controller.confirmPasswordController,
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
    );
  }

  Widget button() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AppButton(
          text: Strings.signUp,
          buttonColor: AppColors.black,
          onPressed: () {
            controller.signUp();
            // Get.toNamed(AppRoutes.mainView);
          },
        ),
        SizedBox(height: 20.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppText(
              text: Strings.already,
              fontFamily: Strings.FONT_FAMILY_Manrope,
              style: AppTextStyle.manropeMedium,
              textSize: 15.sp,
              color: AppColors.greyColor,
            ),
            AppText(
              text: Strings.loginText,
              fontFamily: Strings.FONT_FAMILY_Manrope,
              style: AppTextStyle.manropeSemiBold,
              textSize: 15.sp,
              color: AppColors.black,
            ),
          ],
        )
      ],
    );
  }
}
