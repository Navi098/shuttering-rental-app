import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shuttring_hub/common_widget/app_button.dart';
import 'package:shuttring_hub/common_widget/app_text.dart';
import 'package:shuttring_hub/utils/app_color.dart';
import 'package:shuttring_hub/utils/string.dart';


class CustomerDetailsView extends StatefulWidget {
  const CustomerDetailsView({Key? key}) : super(key: key);

  @override
  State<CustomerDetailsView> createState() => _CustomerDetailsViewState();
}

class _CustomerDetailsViewState extends State<CustomerDetailsView> {

  final String name = 'Raj Kumar';
  final String phone = '98765 43210';
  final String totalRentals = '8';
  final String activeRentalCount = '1';
  final String totalPaid = '₹25,600';

  final Map<String, String> activeRental = {
    'id': '#1001',
    'date': '29 Aug 2026',
    'pendingAmount': '₹2,700 Pending',
  };

  final List<Map<String, String>> rentalHistory = [
    {'id': '#980', 'date': '10 Aug 2026', 'amount': '₹4,200', 'status': 'Completed'},
    {'id': '#921', 'date': '20 Jul 2026', 'amount': '₹3,800', 'status': 'Completed'},
  ];

  String _initials(String fullName) {
    final parts = fullName.trim().split(' ');
    if (parts.length == 1) return parts.first.substring(0, 1).toUpperCase();
    return (parts.first.substring(0, 1) + parts.last.substring(0, 1)).toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(20.w, 12.h, 20.w, 40.h),
              decoration: BoxDecoration(
                color: AppColors.black,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24.r),
                  bottomRight: Radius.circular(24.r),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _iconButton(icon: Icons.arrow_back,
                      onTap: (){
                        Get.back();
                      }),
                      AppText(
                        text: 'Customer Details',
                        fontFamily: Strings.FONT_FAMILY_Manrope,
                        style: AppTextStyle.manropeSemiBold,
                        textSize: 15.sp,
                        color: AppColors.whiteColor,
                      ),
                      _iconButton(icon: Icons.add, onTap: () {
                      }),
                    ],
                  ),
                  SizedBox(height: 22.h),
                  CircleAvatar(
                    radius: 32.r,
                    backgroundColor: AppColors.greyColor,
                    child: AppText(
                      text: _initials(name),
                      fontFamily: Strings.FONT_FAMILY_Manrope,
                      style: AppTextStyle.manropeBold,
                      textSize: 18.sp,
                      color: AppColors.black,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  AppText(
                    text: name,
                    fontFamily: Strings.FONT_FAMILY_Manrope,
                    style: AppTextStyle.manropeSemiBold,
                    textSize: 17.sp,
                    color: AppColors.whiteColor,
                  ),
                  SizedBox(height: 2.h),
                  AppText(
                    text: phone,
                    fontFamily: Strings.FONT_FAMILY_Manrope,
                    style: AppTextStyle.manropeRegular,
                    textSize: 13.sp,
                    color: AppColors.greyColor,
                  ),
                ],
              ),
            ),
            Transform.translate(
              offset: Offset(0, -26.h),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 18.w),
                padding: EdgeInsets.symmetric(vertical: 16.h),
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(16.r),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.black.withOpacity(0.06),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    _statItem(label: 'Total Rentals', value: totalRentals),
                    _statDivider(),
                    _statItem(label: 'Active Rental', value: activeRentalCount),
                    _statDivider(),
                    _statItem(label: 'Total Paid', value: totalPaid),
                  ],
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(18.w, 0, 18.w, 12.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      text: 'Active Rental',
                      fontFamily: Strings.FONT_FAMILY_Manrope,
                      style: AppTextStyle.manropeSemiBold,
                      textSize: 14.sp,
                      color: AppColors.black,
                    ),
                    SizedBox(height: 12.h),
                    _activeRentalCard(
                      id: activeRental['id']!,
                      date: activeRental['date']!,
                      pendingAmount: activeRental['pendingAmount']!,
                      onTap: () {},
                    ),
                    SizedBox(height: 26.h),
                    AppText(
                      text: 'Rental History',
                      fontFamily: Strings.FONT_FAMILY_Manrope,
                      style: AppTextStyle.manropeSemiBold,
                      textSize: 14.sp,
                      color: AppColors.black,
                    ),
                    SizedBox(height: 12.h),
                    ...rentalHistory.map((item) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 10.h),
                        child: _historyItem(
                          id: item['id']!,
                          date: item['date']!,
                          amount: item['amount']!,
                          status: item['status']!,
                        ),
                      );
                    }).toList(),
                  ],
                ),
              ),
            ),
            AppButton(
              text: "+ New Rental",
            buttonColor: AppColors.black,
              onPressed: (){

              },
            ).paddingSymmetric(horizontal: 21.w,vertical:35)
          ],
        ),
      ),
    );
  }

  Widget _iconButton({required IconData icon, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20.r),
      child: Container(
        width: 34.w,
        height: 34.w,
        decoration: BoxDecoration(
          color: AppColors.whiteColor.withOpacity(0.15),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: AppColors.whiteColor, size: 18.sp),
      ),
    );
  }

  Widget _statItem({required String label, required String value}) {
    return Expanded(
      child: Column(
        children: [
          AppText(
            text: label,
            fontFamily: Strings.FONT_FAMILY_Manrope,
            style: AppTextStyle.manropeRegular,
            textSize: 11.sp,
            color: AppColors.black,
          ),
          SizedBox(height: 4.h),
          AppText(
            text: value,
            fontFamily: Strings.FONT_FAMILY_Manrope,
            style: AppTextStyle.manropeBold,
            textSize: 16.sp,
            color: AppColors.black,
          ),
        ],
      ),
    );
  }

  Widget _statDivider() {
    return Container(
      width: 1,
      height: 32.h,
      color: AppColors.appBackgroundColor,
    );
  }

  Widget _activeRentalCard({
    required String id,
    required String date,
    required String pendingAmount,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14.r),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(14.r),
          border: Border.all(color: AppColors.greyColor),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  text: id,
                  fontFamily: Strings.FONT_FAMILY_Manrope,
                  style: AppTextStyle.manropeSemiBold,
                  textSize: 14.sp,
                  color: AppColors.black,
                ),
                SizedBox(height: 4.h),
                AppText(
                  text: date,
                  fontFamily: Strings.FONT_FAMILY_Manrope,
                  style: AppTextStyle.manropeRegular,
                  textSize: 12.sp,
                  color: AppColors.greyColor,
                ),
              ],
            ),
            Row(
              children: [
                AppText(
                  text: pendingAmount,
                  fontFamily: Strings.FONT_FAMILY_Manrope,
                  style: AppTextStyle.manropeSemiBold,
                  textSize: 13.sp,
                  color: AppColors.themeColor,
                ),
                SizedBox(width: 8.w),
                Icon(Icons.chevron_right, color: AppColors.greyColor, size: 18.sp),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _historyItem({
    required String id,
    required String date,
    required String amount,
    required String status,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: AppColors.greyColor),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                text: id,
                fontFamily: Strings.FONT_FAMILY_Manrope,
                style: AppTextStyle.manropeSemiBold,
                textSize: 14.sp,
                color: AppColors.black,
              ),
              SizedBox(height: 4.h),
              AppText(
                text: date,
                fontFamily: Strings.FONT_FAMILY_Manrope,
                style: AppTextStyle.manropeRegular,
                textSize: 12.sp,
                color: AppColors.greyColor,
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                decoration: BoxDecoration(
                  color: AppColors.warning.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: AppText(
                  text: status,
                  fontFamily: Strings.FONT_FAMILY_Manrope,
                  style: AppTextStyle.manropeSemiBold,
                  textSize: 11.sp,
                  color: AppColors.warning,
                ),
              ),
              SizedBox(height: 4.h),
              AppText(
                text: amount,
                fontFamily: Strings.FONT_FAMILY_Manrope,
                style: AppTextStyle.manropeSemiBold,
                textSize: 13.sp,
                color: AppColors.black,
              ),
            ],
          ),
        ],
      ),
    );
  }
}