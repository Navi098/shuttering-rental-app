import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddMaterialController extends GetxController {
  /// Text Controllers
  final nameCtrl = TextEditingController();
  final rateCtrl = TextEditingController();
  final stockCtrl = TextEditingController();
  final ExpansionTileController expansionController =
  ExpansionTileController();
  /// Dropdown Values
  final selectedCategory = RxnString();
  final selectedUnit = RxnString();

  /// Material Type
  final materialType = "Rental".obs;

  /// Dropdown Lists
  final categories = <String>[
    "Plywood",
    "Bamboo",
    "Steel",
    "Wire",
    "Other",
  ];

  final units = <String>[
    "Piece",
    "Kg",
    "Bundle",
    "Sq. ft",
  ];

  @override
  void onInit() {
    super.onInit();

    /// Default Values
    selectedCategory.value = "Plywood";
    selectedUnit.value = "Piece";

    /// Optional test data
    // nameCtrl.text = "Plywood Sheet";
    // rateCtrl.text = "10";
    // stockCtrl.text = "200";
  }

  /// Change Category
  void changeCategory(String? value) {
    selectedCategory.value = value;
  }

  /// Change Unit
  void changeUnit(String? value) {
    selectedUnit.value = value;
  }

  /// Change Material Type
  void changeMaterialType(String value) {
    materialType.value = value;
  }

  /// Save Material
  void saveMaterial() {
    final String name = nameCtrl.text.trim();
    final String rate = rateCtrl.text.trim();
    final String stock = stockCtrl.text.trim();

    if (name.isEmpty) {
      Get.snackbar(
        "Error",
        "Please enter material name",
      );
      return;
    }

    if (selectedCategory.value == null) {
      Get.snackbar(
        "Error",
        "Please select category",
      );
      return;
    }

    if (selectedUnit.value == null) {
      Get.snackbar(
        "Error",
        "Please select unit",
      );
      return;
    }

    if (rate.isEmpty) {
      Get.snackbar(
        "Error",
        "Please enter rate",
      );
      return;
    }

    if (stock.isEmpty) {
      Get.snackbar(
        "Error",
        "Please enter total stock",
      );
      return;
    }

    /// Later API / Firebase / Local Database
    print("Name: $name");
    print("Category: ${selectedCategory.value}");
    print("Type: ${materialType.value}");
    print("Unit: ${selectedUnit.value}");
    print("Rate: $rate");
    print("Stock: $stock");

    Get.back();
  }

  @override
  void onClose() {
    nameCtrl.dispose();
    rateCtrl.dispose();
    stockCtrl.dispose();

    super.onClose();
  }
}