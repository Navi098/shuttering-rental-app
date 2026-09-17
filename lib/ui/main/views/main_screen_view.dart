import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart' show SizeExtension;
import 'package:get/get.dart';
import 'package:shuttring_hub/generated/assets.dart';
import 'package:shuttring_hub/ui/active_rentals/views/active_rental_view.dart';
import 'package:shuttring_hub/ui/customers/views/customer_view.dart';
import 'package:shuttring_hub/ui/home/views/home_view.dart';
import 'package:shuttring_hub/ui/inventory/views/inventory_view.dart';
import 'package:shuttring_hub/ui/main/controller/main_controller.dart';
import 'package:shuttring_hub/ui/rentals/views/rental_view.dart';
import 'package:shuttring_hub/utils/app_color.dart';
import 'package:shuttring_hub/utils/string.dart';

class MainScreenView extends GetView<MainController> {
  MainScreenView({super.key});

  final List<Widget> views = [
    HomeView(),
    ActiveRentalView(),
    CustomerView(),
    InventoryView(),
  ];

  final List<_NavItem> _navItems = [
    _NavItem(icon: Assets.homeView, label: Strings.home),
    _NavItem(icon: Assets.rentalsIcon, label: Strings.rental),
    _NavItem(icon: Assets.peopleIcon, label: Strings.customer),
    _NavItem(icon: Assets.inventory, label: Strings.inventory),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
            () => IndexedStack(
          index: controller.currentIndex.value,
          children: views,
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(context),
    );
  }

  Widget _buildBottomNavBar(BuildContext context) {
    return Container(
      height: 78.h,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.r),
          topRight: Radius.circular(24.r),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 16,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.r),
          topRight: Radius.circular(24.r),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final double tabWidth = constraints.maxWidth / _navItems.length;
            return Obx(
                  () {
                final int selected = controller.currentIndex.value;
                return Stack(
                  children: [
                    AnimatedPositioned(
                      duration: const Duration(milliseconds: 280),
                      curve: Curves.easeOutCubic,
                      top: 0,
                      left: tabWidth * selected,
                      width: tabWidth,
                      height: 4.h,
                      child: Center(
                        child: Container(
                          height: 4.h,
                          width: 32.w,
                          decoration: BoxDecoration(
                            color: AppColors.black,
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: List.generate(_navItems.length, (index) {
                          final bool isSelected = selected == index;
                          final item = _navItems[index];
                          return Expanded(
                            child: GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onTap: () => controller.changeTab(index),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 6.h,
                                  horizontal: 6.w,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    AnimatedScale(
                                      duration: const Duration(milliseconds: 220),
                                      curve: Curves.elasticOut,
                                      scale: isSelected ? 1.15 : 1.0,
                                      child: ColorFiltered(
                                        colorFilter: ColorFilter.mode(
                                          isSelected
                                              ? AppColors.black
                                              : AppColors.black.withOpacity(0.4),
                                          BlendMode.srcIn,
                                        ),
                                        child: Image(
                                          image: AssetImage(item.icon),
                                          height: 22.h,
                                          width: 22.w,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 4.h),
                                    AnimatedDefaultTextStyle(
                                      duration: const Duration(milliseconds: 220),
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        fontFamily: Strings.FONT_FAMILY_Manrope,
                                        fontWeight: isSelected
                                            ? FontWeight.w700
                                            : FontWeight.w500,
                                        color: isSelected
                                            ? AppColors.black
                                            : AppColors.black.withOpacity(0.4),
                                      ),
                                      child: Text(item.label),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
class _NavItem {
  final String icon;
  final String label;
  _NavItem({required this.icon, required this.label});
}