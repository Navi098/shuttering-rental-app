
import 'package:get/get.dart';
import 'package:shuttring_hub/ui/auth/controller/sign_up_controller.dart';

class SignUpBinding extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut<SignUpController>(()=>SignUpController());
  }
}