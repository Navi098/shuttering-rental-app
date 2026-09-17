
import 'package:get/get.dart';
import 'package:shuttring_hub/ui/onboarding/controller/onbording_controller.dart';

class OnbordingBinding extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut<OnbordingController>(()=>OnbordingController());
  }
}