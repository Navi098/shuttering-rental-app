import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shuttring_hub/generated/assets.dart';
import 'package:shuttring_hub/ui/onboarding/controller/onbording_controller.dart';
import 'package:shuttring_hub/ui/onboarding/custom_widgets/onboarding_item.dart';
import 'package:shuttring_hub/utils/app_color.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingView extends GetView<OnbordingController> {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      body: Column(
        children: [
          Expanded(child: pageView(),)
        ],
      ),
    );
  }

  Widget pageView(){
    return Column(
      children: [
        Expanded(child: PageView(
          controller: controller.pageController,
          onPageChanged: controller.currentPage,
          children: [
            OnboardingItem(image: Assets.imageMaterialIcon,
                description: "All Shuttering Materials in One Place",
                title: "Bamboo, plywood, beams, steel plates, binding wire and more — available for rent."
            ),
            OnboardingItem(image: Assets.imageBookingIcon,
                description: "All Shuttering Materials in One Place",
                title: "Bamboo, plywood, beams, steel plates, binding wire and more — available for rent."
            ),
            OnboardingItem(image: Assets.imageDeliveryIcon,
                description: "All Shuttering Materials in One Place",
                title: "Bamboo, plywood, beams, steel plates, binding wire and more — available for rent."
            )
          ],
        )
        ),
        SizedBox(height: 20.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SmoothPageIndicator(
              controller: controller.pageController,
              count: 3,
              effect: const ExpandingDotsEffect(
                dotHeight: 8,
                dotWidth: 8,
                spacing: 6,
              ),
            )
          ],
        )
      ],
    );
  }
}


