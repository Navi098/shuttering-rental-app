import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart' show SizeExtension;
import 'package:get/get.dart';
import 'package:shuttring_hub/utils/string.dart' show Strings;
import '../common_widget/app_text.dart' show AppText, AppTextStyle;
import 'app_color.dart' show AppColors;

class Utils {
  static Future<bool> hasNetwork() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      Utils.showSnackBar("Please check your internet connection");
      return false;
    } else {
      return true;
    }
  }

  static showSnackBar(String? message, {bool? isSuccess = false}) {
    if (message == null) {
      return;
    }
    Get.closeAllSnackbars();
    Get.rawSnackbar(
      duration: const Duration(seconds: 2),
      message: message,
      padding: EdgeInsets.only(left: 20.w, bottom: 13.h, top: 13.h, right: 30),
      margin: EdgeInsets.fromLTRB(10.w, 10.h, 10.w, 10.h),
      backgroundColor: AppColors.whiteColor,
      borderRadius: 5,
      borderWidth: 1.2,
      borderColor: AppColors.borderColor,
      snackPosition: SnackPosition.TOP,
      messageText: Row(
        children: [
          isSuccess == true ? const Icon(Icons.check) : const SizedBox(),
          const SizedBox(width: 6),
          Expanded(
            child: AppText(
              text: message,
              style: AppTextStyle.manropeBold,
              fontFamily: Strings.FONT_FAMILY_Manrope,
              textSize: 16.sp,
              color: AppColors.blackColor,
            ),
          ),
        ],
      ),
    );
  }
}
