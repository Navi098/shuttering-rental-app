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

class SelectMaterialView extends StatefulWidget {
  const SelectMaterialView({super.key});

  @override
  State<SelectMaterialView> createState() => _SelectMaterialViewState();
}

class _SelectMaterialViewState extends State<SelectMaterialView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      appBar: BasicAppBar(title: Strings.materials, onTap: () {
        Get.back();
      },
        line: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  searchFiled(),
                  SizedBox(height: 15.h),
                  materialList(),
                ],
              ),
            ),
            addMaterialButton(),
            SizedBox(height: 35.h),
          ],
        ),
      ),
    );
  }

  Widget searchFiled() {
    return AppTextField(height: 48.h, hint: "Search material",
      vPadding: 0,
      borderRadius: 20.r,
      prefixIconPath: Assets.imageSearchIcon,
      prefixIconUnfocusedColor: AppColors.black,
    );
  }

  Widget materialList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 5,
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            materialCard(),
            SizedBox(height: 8.h),
          ],
        );
      },
    );
  }

  Widget materialCard() {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: const Color(0xffE9E5DA), width: 1.5.w),
      ),
      child: Row(
        children: [
          Checkbox(
            value: false,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6.r),
            ),
            activeColor: AppColors.black,
            onChanged: null,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  text: "Bamboo",
                  style: AppTextStyle.manropeBold,
                  fontFamily: Strings.FONT_FAMILY_Manrope,
                  textSize: 12.sp,
                  color: AppColors.black,
                ),
                AppText(
                  text: "₹50/day · Avail: 200 pieces",
                  style: AppTextStyle.manropeMedium,
                  fontFamily: Strings.FONT_FAMILY_Manrope,
                  textSize: 12.sp,
                  color: AppColors.greyColor,
                ),
              ],
            ),
          ),
          quantityCounter(0),
        ],
      ),
    );
  }

  Widget quantityCounter(int qty) {
    return Row(
      children: [
        counterButton(icon: Icons.remove, isAdd: false),
        SizedBox(width: 14.w),
        Text(
          "$qty",
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
        ),
        SizedBox(width: 14.w),
        counterButton(icon: Icons.add, isAdd: true),
      ],
    );
  }

  Widget counterButton({required IconData icon, required bool isAdd}) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(20.r),
      child: Container(
        height: 28.h,
        width: 28.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isAdd
              ? AppColors.rentAccent.withOpacity(0.15)
              : Colors.grey.shade200,
        ),
        child: Icon(
          icon,
          size: 16.sp,
          color: isAdd ? AppColors.rentAccent : Colors.grey.shade600,
        ),
      ),
    );
  }
}

Widget addMaterialButton() {
  return AppButton(
    text: "Next",
    buttonColor: AppColors.black,
    onPressed: () {
      Get.toNamed(AppRoutes.rentalShowMaterial);
    },
  );
}
