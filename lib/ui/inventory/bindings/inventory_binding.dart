
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:shuttring_hub/ui/home/controller/home_controller.dart';
import 'package:shuttring_hub/ui/inventory/controller/add_material_controller.dart';
import 'package:shuttring_hub/ui/inventory/controller/inventory_controller.dart';

class InventoryBinding extends Bindings{

  @override
  void dependencies(){
    Get.lazyPut<InventoryController>(()=>InventoryController());
    Get.lazyPut<AddMaterialController>(()=>AddMaterialController());
  }
}