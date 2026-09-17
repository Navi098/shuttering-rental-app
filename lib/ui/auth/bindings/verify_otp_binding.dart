

import 'package:get/get.dart';
import 'package:shuttring_hub/ui/auth/controller/verify_otp_controller.dart';

class VerifyOtpBinding extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut<VerifyOtpController>(()=>VerifyOtpController());
  }
}