import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shuttring_hub/utils/app_pages.dart';
import 'package:shuttring_hub/utils/app_routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const ShutteringRentalApp());
}

class ShutteringRentalApp extends StatelessWidget {
  const ShutteringRentalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          title: 'Shuttering Rental',
          debugShowCheckedModeBanner: false,
         initialRoute: AppRoutes.loginView,
          getPages: AppPages.routes,
        );
      },
    );
  }
}