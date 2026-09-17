
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:shuttring_hub/ui/auth/controller/sign_up_controller.dart';
import 'package:shuttring_hub/ui/auth/controller/verify_otp_controller.dart';
import 'package:shuttring_hub/ui/inventory/controller/add_material_controller.dart';
import 'package:shuttring_hub/ui/main/controller/main_controller.dart';
import 'package:shuttring_hub/ui/onboarding/controller/onbording_controller.dart';
import 'package:shuttring_hub/ui/onboarding/view/onboarding_view.dart';

class MainBinding extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut<MainController>(()=> MainController());
    Get.lazyPut<AddMaterialController>(()=> AddMaterialController());
    Get.lazyPut<OnbordingController>(()=> OnbordingController());
    Get.lazyPut<SignUpController>(()=> SignUpController());
    Get.lazyPut<VerifyOtpController>(()=> VerifyOtpController());
  }
}