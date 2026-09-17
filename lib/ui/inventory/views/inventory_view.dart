import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shuttring_hub/common_widget/app_text.dart';
import 'package:shuttring_hub/common_widget/app_text_form_field.dart';
import 'package:shuttring_hub/common_widget/main_app_bar.dart';
import 'package:shuttring_hub/generated/assets.dart';
import 'package:shuttring_hub/utils/app_color.dart';
import 'package:shuttring_hub/utils/app_routes.dart';
import 'package:shuttring_hub/utils/string.dart';

class InventoryView extends StatefulWidget {
  const InventoryView({super.key});

  @override
  State<InventoryView> createState() => _InventoryViewState();
}

class _InventoryViewState extends State<InventoryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      appBar: MainAppBar(
        title: Strings.materials,
        images: Assets.notificationIcon,
        onTap: (){

        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            SizedBox(height: 10.h),
            searchField(),
            SizedBox(height: 20.h),
            materialList(),
          ],
        ),
      ),
    );
  }

  Widget searchField(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child:AppTextField(
          height: 48.h,
          vPadding: 0,
          borderRadius: 20.r,
          hint: "Search Materials",
          prefixIconPath: Assets.imageSearchIcon,
          prefixIconUnfocusedColor: AppColors.black,
        ),),
        SizedBox(width: 10.w),
        GestureDetector(
          onTap: (){
            Get.toNamed(AppRoutes.addMaterialView);
          },
          child:Container(
            padding: EdgeInsets.all(7.h),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Icon(Icons.add,color: AppColors.whiteColor),
          ),
        ),
      ],
    );
  }

  Widget materialList(){
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: 5,
        itemBuilder: (context,index){
          return Column(
            children: [
              customWidget(
                title: "Bamboo",
                date: "20-2-2026",
                rupee: 200,
                status: "Active",
              ),
              SizedBox(height: 10.h),
            ],
          );
        }
    );
  }


  Widget customWidget({
    required String title,
    required String date,
    required int rupee,
    required String status,
  }) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color:Color(0xffE9E5DA),
          width: 1.5.w,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 36.w,
            height: 36.w,
            decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(10.r),
                color: Color(0xffFBE6DD)
            ),
            child: Center(
              child:Image(image: AssetImage(Assets.bambooIcon),
              height: 24.h,
               width: 24.w,
              )
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: AppText(
                        text: title,
                        fontFamily: Strings.FONT_FAMILY_Manrope,
                        style: AppTextStyle.manropeSemiBold,
                        textSize: 14.sp,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 10.w),
                    AppText(
                      text: "₹$rupee",
                      fontFamily: Strings.FONT_FAMILY_Manrope,
                      style: AppTextStyle.manropeSemiBold,
                      textSize: 13.sp,
                      color: AppColors.black,
                    ),
                  ],
                ),
                SizedBox(height: 5.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: AppColors.secondaryColor,
                      ),
                      child: AppText(
                        text: "Piece",
                        fontFamily: Strings.FONT_FAMILY_Manrope,
                        style: AppTextStyle.manropeSemiBold,
                        textSize: 13.sp,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Color(0xffE9ECEF),
                      ),
                      child: AppText(
                        text: "200 avail",
                        fontFamily: Strings.FONT_FAMILY_Manrope,
                        style: AppTextStyle.manropeSemiBold,
                        textSize: 13.sp,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],


      ),
    );
  }
}
