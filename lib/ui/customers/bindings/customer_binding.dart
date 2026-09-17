
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:shuttring_hub/ui/customers/controller/customer_controller.dart';

class CustomerBinding extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut<CustomerController>(()=>CustomerController());
  }
}