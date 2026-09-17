import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:shuttring_hub/ui/rentals/controller/rental_controller.dart';

class RentalBinding extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut<RentalController>(()=>RentalController());
  }
}