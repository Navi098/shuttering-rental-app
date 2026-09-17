
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:shuttring_hub/ui/profile/controller/profile_controller.dart';

class ProfileBinding extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut<ProfileController>(()=>ProfileController());
  }
}