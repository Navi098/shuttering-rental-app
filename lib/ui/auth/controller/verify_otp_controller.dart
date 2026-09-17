import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuttring_hub/data/api_provider/auth_api_provider.dart';
import 'package:shuttring_hub/data/model/user_model.dart';
import 'package:shuttring_hub/data/shared/data_response.dart';
import 'package:shuttring_hub/utils/app_routes.dart';
import 'package:shuttring_hub/utils/utils.dart';

class VerifyOtpController extends GetxController {
  final otpController = TextEditingController();
  late  AuthApiProvider _authApiProvider;

  String phone = "";
  String otp = "";

  @override
  void onInit() {
    _authApiProvider = AuthApiProvider();
    super.onInit();
    final arguments = Get.arguments;
    phone = arguments["phone"] ?? "";
    otp = arguments["otp"]?.toString() ?? "";
    debugPrint("Phone: $phone");
    debugPrint("OTP: $otp");
  }

  Future<void> verifyOtp() async {
    try {
      if(await Utils.hasNetwork()) return;
      final enteredOtp = otpController.text.trim();
      final Map<String, dynamic> body = {
        "phone": phone,
        "otp": enteredOtp,
      };
      debugPrint("Verify OTP Body: $body");
      final DataResponse<UserModel?> dataResponse =
          await _authApiProvider.verifyOtp(body);
      if (dataResponse.isSuccess == false) {
        Utils.showSnackBar(dataResponse.message);
        return;
      }
      Get.offAllNamed(AppRoutes.mainView);
    } catch (e, stackTrace) {
      debugPrint("Verify OTP Error: $e");
      debugPrintStack(stackTrace: stackTrace);
    }
  }


  @override
  void onClose() {
    otpController.dispose();
    super.onClose();
  }
}