class ProductModel {
  final String id;
  final String name;
  final String description;
  final String categoryId;
  final double salePrice;
  final double rentalPricePerDay;
  final double securityDeposit;
  final String unit;
  final bool isAvailable;
  final double rating;
  final int stock;
  final bool isRental;
  final bool isSale;
  final String? imageAsset;

  const ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.categoryId,
    required this.salePrice,
    required this.rentalPricePerDay,
    required this.securityDeposit,
    this.unit = 'piece',
    this.isAvailable = true,
    this.rating = 0,
    this.stock = 0,
    this.isRental = true,
    this.isSale = true,
    this.imageAsset,
  });

  double get displayPrice => isSale ? salePrice : rentalPricePerDay;
}
