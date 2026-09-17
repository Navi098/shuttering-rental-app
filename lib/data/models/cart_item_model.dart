import 'package:shuttring_hub/data/models/product_model.dart';

class CartItemModel {
  final ProductModel product;
  int quantity;

  CartItemModel({
    required this.product,
    this.quantity = 1,
  });

  double get lineTotal => product.salePrice * quantity;
}
