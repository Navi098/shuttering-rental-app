import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuttring_hub/utils/app_color.dart';

class ShimmerBox extends StatefulWidget {
  const ShimmerBox({
    super.key,
    this.height,
    this.width,
    this.radius,
  });

  final double? height;
  final double? width;
  final double? radius;

  @override
  State<ShimmerBox> createState() => _ShimmerBoxState();
}

class _ShimmerBoxState extends State<ShimmerBox>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1100),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: Tween<double>(begin: 0.45, end: 1).animate(_controller),
      child: Container(
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
          color: AppColors.mutedSurface,
          borderRadius: BorderRadius.circular(widget.radius ?? 12.r),
        ),
      ),
    );
  }
}

class HomeShimmer extends StatelessWidget {
  const HomeShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 24.h),
      children: [
        ShimmerBox(height: 52.h, radius: 16.r),
        SizedBox(height: 16.h),
        ShimmerBox(height: 150.h, radius: 18.r),
        SizedBox(height: 20.h),
        ShimmerBox(height: 18.h, width: 160.w),
        SizedBox(height: 12.h),
        SizedBox(
          height: 96.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: 6,
            separatorBuilder: (_, __) => SizedBox(width: 12.w),
            itemBuilder: (_, __) => Column(
              children: [
                ShimmerBox(height: 62.w, width: 62.w, radius: 31.r),
                SizedBox(height: 8.h),
                ShimmerBox(height: 12.h, width: 54.w),
              ],
            ),
          ),
        ),
        SizedBox(height: 18.h),
        Row(
          children: [
            Expanded(child: ShimmerBox(height: 110.h, radius: 16.r)),
            SizedBox(width: 12.w),
            Expanded(child: ShimmerBox(height: 110.h, radius: 16.r)),
          ],
        ),
        SizedBox(height: 20.h),
        Row(
          children: [
            Expanded(child: ShimmerBox(height: 210.h, radius: 16.r)),
            SizedBox(width: 12.w),
            Expanded(child: ShimmerBox(height: 210.h, radius: 16.r)),
          ],
        ),
      ],
    );
  }
}
