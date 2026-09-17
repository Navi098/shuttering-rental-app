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

class ForgotView extends StatefulWidget {
  const ForgotView({super.key});

  @override
  State<ForgotView> createState() => _ForgotViewState();
}

class _ForgotViewState extends State<ForgotView> {
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
      body:SingleChildScrollView(
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 30.h),
                contentWidget()
              ],
            ),
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
              image: AssetImage(Assets.lockIcon),
              fit: BoxFit.cover,
              height: 80.h,
              width: 80.w,
            ),
          ),
        ),
        SizedBox(height: 20.h),
        AppText(text: Strings.forgotPassword,
          fontFamily: Strings.FONT_FAMILY_Manrope,
          style: AppTextStyle.manropeExtraBold,
          textSize: 24.sp,
          color: AppColors.black,
        ),
        SizedBox(height: 7.h),
        AppText(
          textAlign: TextAlign.center,
          text: Strings.worries,
          fontFamily: Strings.FONT_FAMILY_Manrope,
          style: AppTextStyle.manropeMedium,
          textSize: 15.sp,
          color: AppColors.greyColor,
        ),
      ],
    );
  }

  Widget fields(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          text: Strings.email,
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
          hint: "Enter a email",
          prefixIconPath: Assets.mailIcon,
          prefixIconUnfocusedColor: AppColors.black,
        ),
      ],
    ).paddingSymmetric(horizontal: 21.w,vertical: 12.h);
  }

  Widget button(){
    return AppButton(text: "Send Reset Code",
    buttonColor: AppColors.black,
    onPressed: (){
      Get.toNamed(AppRoutes.verifyOtp);
    },
    ).paddingSymmetric(horizontal: 21.w);
  }
}
