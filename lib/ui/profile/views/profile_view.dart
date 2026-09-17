import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart' show SizeExtension;
import 'package:get/get.dart';
import 'package:shuttring_hub/common_widget/app_button.dart';
import 'package:shuttring_hub/common_widget/basic_app_bar.dart';
import 'package:shuttring_hub/generated/assets.dart';
import 'package:shuttring_hub/utils/app_color.dart';
import 'package:shuttring_hub/utils/app_routes.dart';
import '../../../common_widget/app_text.dart' show AppText, AppTextStyle;
import '../../../utils/string.dart' show Strings;

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      appBar: BasicAppBar(
        line: true,
        title: "Profile",
        onTap: () {
          Get.back();
        },
      ),
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8.h),
              profileView(),
              SizedBox(height: 30.h),
              profileContent(),
            ],
          ),),
          logoutButton(),
          SizedBox(height: 50.h),
        ],
      )
    );
  }

  Widget profileView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: const Color(0xffE9E5DA),
                  width: 1.5.w,
                ),
              ),
              child: ClipOval(
                child: Image(
                  image: AssetImage(Assets.imageMan),
                  height: 60.h,
                  width: 60.w,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 7.w),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          text: "Navdeep",
                          fontFamily: Strings.FONT_FAMILY_Manrope,
                          style: AppTextStyle.manropeSemiBold,
                          textSize: 18.sp,
                          color: AppColors.black,
                        ),
                        AppText(
                          text: "navdeepSunam@gmail.com",
                          fontFamily: Strings.FONT_FAMILY_Manrope,
                          style: AppTextStyle.manropeMedium,
                          textSize: 14.sp,
                          color: AppColors.greyColor,
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Get.toNamed(AppRoutes.editProfileView);
                    },
                    child: Center(
                      child: Container(
                        padding: EdgeInsets.all(7.w),
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ).paddingSymmetric(horizontal: 15.w, vertical: 7),
        SizedBox(height: 5.h),
        Container(height: 1.5.h, width: Get.width, color: Color(0xffE9E5DA)),
      ],
    );
  }

  Widget profileContent() {
    return Column(
      children: [
        custom(
          title: Strings.notification,
          image: Assets.notificationIcon,
          rightIcon: Assets.rightIcon,
        ),
        SizedBox(height: 16.h),
        custom(
          title: Strings.deleteAccount,
          image: Assets.deleteIcon,
          rightIcon: Assets.rightIcon,
        ),
        SizedBox(height: 16.h),
        custom(
          title: Strings.help,
          image: Assets.help,
          rightIcon: Assets.rightIcon,
        ),
        SizedBox(height: 16.h),
        custom(
          title: Strings.terms,
          image: Assets.terms,
          rightIcon: Assets.rightIcon,
        ),
      ],
    ).paddingSymmetric(horizontal: 17.w);
  }

  Widget custom({
    required String title,
    required String image,
    required String rightIcon,
  }) {
    return Container(
          padding: EdgeInsets.all(9.r),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black12,width: 1.5.w),
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                  height: 25.h,
                  width: 24.w,
                ),
                SizedBox(width: 8.w),
                Expanded(child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(
                      text: title,
                      style: AppTextStyle.manropeBold,
                      fontFamily: Strings.FONT_FAMILY_Manrope,
                      textSize: 15.sp,
                      color: AppColors.black,
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xffE9E5DA),width: 1.5.w),
                        shape: BoxShape.circle,
                      ),
                      child: Image(
                        image: AssetImage(rightIcon),
                        fit: BoxFit.cover,
                        height: 18.h,
                        width: 18.w,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),)
              ]
          ),
    );
  }

  Widget logoutButton(){
    return AppButton(text: "Logout",
    buttonColor: AppColors.black,
    onPressed: (){

    },
    ).paddingSymmetric(horizontal: 21.w);
  }
}
