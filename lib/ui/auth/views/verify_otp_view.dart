import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart' show SizeExtension;
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart' show Get;
import 'package:pinput/pinput.dart';
import 'package:shuttring_hub/common_widget/app_button.dart';
import 'package:shuttring_hub/common_widget/basic_app_bar.dart';
import 'package:shuttring_hub/generated/assets.dart';
import 'package:shuttring_hub/ui/auth/controller/verify_otp_controller.dart';
import 'package:shuttring_hub/utils/app_color.dart';
import 'package:shuttring_hub/utils/app_routes.dart';
import '../../../common_widget/app_text.dart' show AppText, AppTextStyle;
import '../../../utils/string.dart' show Strings;

class VerifyOtpView extends GetView<VerifyOtpController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      appBar: BasicAppBar(
        line: true,
        onTap: (){
          Get.back();
        },
      ),
      body: SingleChildScrollView(
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30.h),
            contentWidget(),
            SizedBox(height: 30.h),
            pinputField(),
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
              image: AssetImage(Assets.emailYellow),
              fit: BoxFit.cover,
              height: 70.h,
              width: 70.w,
            ),
          ),
        ),
        SizedBox(height: 20.h),
        AppText(
          text: Strings.verify,
          fontFamily: Strings.FONT_FAMILY_Manrope,
          style: AppTextStyle.manropeExtraBold,
          textSize: 24.sp,
          color: AppColors.black,
        ),
        SizedBox(height: 7.h),
        AppText(
          textAlign: TextAlign.center,
          text: "Enter the 4-digit code sent to your email",
          fontFamily: Strings.FONT_FAMILY_Manrope,
          style: AppTextStyle.manropeMedium,
          textSize: 15.sp,
          color: AppColors.greyColor,
        ),
      ],
    );
  }

  Widget pinputField() {
    return Column(
      children: [
        Pinput(
          controller: controller.otpController,
          length: 4,
          separatorBuilder: (index) => const SizedBox(width: 22),
          defaultPinTheme: PinTheme(
            width: 57.w,
            height: 57.h,
            textStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.black),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        SizedBox(height: 18.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppText(
              text: Strings.code,
              fontFamily: Strings.FONT_FAMILY_Manrope,
              style: AppTextStyle.manropeMedium,
              textSize: 15.sp,
              color: AppColors.greyColor,
            ),
            AppText(
              text: Strings.resend,
              fontFamily: Strings.FONT_FAMILY_Manrope,
              style: AppTextStyle.manropeSemiBold,
              textSize: 15.sp,
              color: AppColors.black,
            ),
          ],
        ),
      ],
    );
  }

  Widget button() {
    return AppButton(
      text: "Verify",
      buttonColor: AppColors.black,
      onPressed: () {
        controller.verifyOtp();
      //  Get.toNamed(AppRoutes.resetPasswordView);
      },
    ).paddingSymmetric(horizontal: 21);
  }
}
