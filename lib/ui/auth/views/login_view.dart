import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shuttring_hub/common_widget/app_button.dart';
import 'package:shuttring_hub/common_widget/app_text.dart';
import 'package:shuttring_hub/common_widget/app_text_form_field.dart';
import 'package:shuttring_hub/generated/assets.dart';
import 'package:shuttring_hub/ui/auth/controller/login_controller.dart';
import 'package:shuttring_hub/utils/app_color.dart';
import 'package:shuttring_hub/utils/app_routes.dart';
import 'package:shuttring_hub/utils/string.dart';

class LoginView extends GetView<LoginController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(13.0),
        child: SingleChildScrollView(
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 35.h),
              topView(),
              SizedBox(height: 10.h),
              textFields(),
              SizedBox(height: 35.h),
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
        Image(image: AssetImage(Assets.imageLoginLogo), fit: BoxFit.contain),
        SizedBox(height: 4.h),
        AppText(
          text: Strings.welcomeBack,
          fontFamily: Strings.FONT_FAMILY_Manrope,
          style: AppTextStyle.manropeExtraBold,
          textSize: 24.sp,
          color: AppColors.black,
        ),
        SizedBox(height: 7.h),
        AppText(
          text: Strings.loginToContinue,
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
          text: Strings.phoneNumber,
          fontFamily: Strings.FONT_FAMILY_Manrope,
          style: AppTextStyle.manropeSemiBold,
          textSize: 15.sp,
          color: AppColors.black,
        ),
        SizedBox(height: 5.h),
        AppTextField(
          controller: controller.phoneController,
          hint: "Phone number" ,
          prefixIconPath: Assets.mailIcon,
          prefixIconUnfocusedColor: AppColors.black,
          borderRadius: 20.r,
          hPadding: EdgeInsets.symmetric(
            horizontal: 4.w,
            vertical: 10.h,
          ),
        ),
        SizedBox(height: 15.h),
        AppText(
          text: Strings.password,
          fontFamily: Strings.FONT_FAMILY_Manrope,
          style: AppTextStyle.manropeSemiBold,
          textSize: 15.sp,
          color: AppColors.black,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(height: 5.h),
            AppTextField(
              controller: controller.passwordController,
              hint: "Password",
              prefixIconPath: Assets.passwordIcon,
              prefixIconUnfocusedColor: AppColors.black,
              borderRadius: 20.r,
              hPadding: EdgeInsets.symmetric(
                horizontal: 4.w,
                vertical: 10.h,
              ),
            ),
            SizedBox(height: 5.h),
            GestureDetector(
              onTap: (){
                Get.toNamed(AppRoutes.forgotView);
              },
              child: AppText(
                text: Strings.forgotPassword,
                fontFamily: Strings.FONT_FAMILY_Manrope,
                style: AppTextStyle.manropeMedium,
                textSize: 14.sp,
                color: AppColors.black,
              ).paddingOnly(right: 8.w),
            )
          ],
        ),
      ],
    );
  }

  Widget button() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AppButton(
          text: Strings.loginText,
          buttonColor: AppColors.black,
          onPressed: () {
            controller.login();

         //   Get.toNamed(AppRoutes.signUpView);
          },
        ),
        SizedBox(height: 40.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppText(
              text: Strings.don,
              fontFamily: Strings.FONT_FAMILY_Manrope,
              style: AppTextStyle.manropeMedium,
              textSize: 15.sp,
              color: AppColors.greyColor,
            ),
            AppText(
              text: Strings.signUp,
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
