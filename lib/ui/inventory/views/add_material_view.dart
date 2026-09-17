import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shuttring_hub/common_widget/app_button.dart';
import 'package:shuttring_hub/common_widget/app_text_form_field.dart';
import 'package:shuttring_hub/common_widget/basic_app_bar.dart';
import 'package:shuttring_hub/common_widget/app_text.dart';
import 'package:shuttring_hub/utils/app_color.dart';
import 'package:shuttring_hub/utils/string.dart';
import '../../../generated/assets.dart' show Assets;
import '../controller/add_material_controller.dart';

class AddMaterialView extends GetView<AddMaterialController> {
  const AddMaterialView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      appBar: BasicAppBar(
        line: true,
        onTap: () {
          Get.back();
        },
        title: "Add Material",
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
                vertical: 20.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  addMaterialWidgets(),
                  SizedBox(height: 16.h),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
              20.w,
              0,
              20.w,
              24.h,
            ),
            child: AppButton(text: "Save Material",
            buttonColor: AppColors.black,
              onPressed: (){

              },
            )
          ),
        ],
      ),
    );
  }


  Widget addMaterialWidgets() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: GestureDetector(
            onTap: () {
              // controller.pickImage();
            },
            child: Container(
              width: 72.w,
              height: 72.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.grey,
                ),
              ),
              child: Icon(
                Icons.camera_alt_outlined,
                color: Colors.black,
                size: 26.sp,
              ),
            ),
          ),
        ),
        SizedBox(height: 24.h),
        _fieldLabel("Material Name"),
        SizedBox(height: 2.h),
        AppTextField(
          hint: "Enter material name",
          vPadding: 0,
          borderRadius: 20.r,
        ),
        SizedBox(height: 16.h),
        _fieldLabel("Category"),
        Obx(() =>
            _dropdownField(
              value: controller.selectedCategory.value,
              items: controller.categories,
              onChanged: controller.changeCategory,
            ),
        ),
        SizedBox(height: 16.h),
        _fieldLabel("Unit"),
        Obx(() =>
            _dropdownField(
              value: controller.selectedUnit.value,
              items: controller.units,
              onChanged: controller.changeUnit,
            ),
        ),
        SizedBox(height: 16.h),
        _fieldLabel("Rental Rate (Per Day)"),
        AppTextField(
          borderRadius: 20.r,
          hint: "Rental rate",
        ),
        SizedBox(height: 16.h),
        _fieldLabel("Total Stock"),
        AppTextField(
          borderRadius: 20.r,
          hint: "Total Stock",
        ),
      ],
    );
  }

  Widget _fieldLabel(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: AppText(
        text: text,
        fontFamily: Strings.FONT_FAMILY_Manrope,
        style: AppTextStyle.manropeSemiBold,
        textSize: 13.sp,
        color: AppColors.black,
      ),
    );
  }

  Widget _dropdownField({
    required String? value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    final ExpansionTileController expansionController =
    ExpansionTileController();
    return Container(
      decoration: BoxDecoration(
        color: AppColors.appBackgroundColor,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
          color: AppColors.greyColor,
        ),
      ),
      child: Theme(
        data: Theme.of(Get.context!).copyWith(
          dividerColor: Colors.transparent,
        ),
        child: ExpansionTile(
          controller: expansionController,
          minTileHeight: 52.h,
          tilePadding: EdgeInsets.symmetric(
            horizontal: 14.w,
          ),
          childrenPadding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          collapsedShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          title: AppText(
            text: value ?? "Select Item",
            fontFamily: Strings.FONT_FAMILY_Manrope,
            style: AppTextStyle.manropeRegular,
            textSize: 14.sp,
            color: value == null
                ? AppColors.greyColor
                : AppColors.black,
          ),
          iconColor: AppColors.greyColor,
          collapsedIconColor: AppColors.greyColor,
          children: items.map((item) {
            return InkWell(
              onTap: () {
                onChanged(item);
                expansionController.collapse();
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  horizontal: 14.w,
                  vertical: 12.h,
                ),
                child: AppText(
                  text: item,
                  fontFamily: Strings.FONT_FAMILY_Manrope,
                  style: AppTextStyle.manropeRegular,
                  textSize: 14.sp,
                  color: AppColors.black,
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}