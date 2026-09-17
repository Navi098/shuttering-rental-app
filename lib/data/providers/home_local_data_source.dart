import 'package:flutter/material.dart';
import 'package:shuttring_hub/data/models/banner_model.dart';
import 'package:shuttring_hub/data/models/category_model.dart';
import 'package:shuttring_hub/data/models/location_model.dart';
import 'package:shuttring_hub/data/models/order_model.dart';
import 'package:shuttring_hub/data/models/product_model.dart';
import 'package:shuttring_hub/generated/assets.dart';

/// Local dummy source. Swap this class for a remote API provider later.
class HomeLocalDataSource {
  Future<List<CategoryModel>> getCategories() async {
    await Future<void>.delayed(const Duration(milliseconds: 450));
    return const [
      CategoryModel(id: 'plates', name: 'Shuttering Plates', icon: Icons.layers_outlined),
      CategoryModel(id: 'props', name: 'Props', icon: Icons.vertical_align_center),
      CategoryModel(id: 'jacks', name: 'Jacks', icon: Icons.settings_outlined),
      CategoryModel(id: 'channels', name: 'Channels', icon: Icons.view_week_outlined),
      CategoryModel(id: 'scaffolding', name: 'Scaffolding', icon: Icons.apartment_outlined),
      CategoryModel(id: 'accessories', name: 'Accessories', icon: Icons.handyman_outlined),
    ];
  }

  Future<List<BannerModel>> getBanners() async {
    await Future<void>.delayed(const Duration(milliseconds: 350));
    return const [
      BannerModel(
        id: 'b1',
        title: 'Quality Shuttering Material\nFor Every Construction Project',
        subtitle: 'Rent or buy construction materials at the best prices.',
        imageAsset: Assets.imageConstruction,
      ),
      BannerModel(
        id: 'b2',
        title: 'Heavy-Duty Props &\nCentering Plates',
        subtitle: 'Trusted by contractors across Punjab and Chandigarh.',
      ),
      BannerModel(
        id: 'b3',
        title: 'Scaffolding Ready\nWhen Your Site Is',
        subtitle: 'Fast delivery, quality checks, and flexible rental terms.',
      ),
    ];
  }

  Future<List<ProductModel>> getProducts() async {
    await Future<void>.delayed(const Duration(milliseconds: 500));
    return const [
      ProductModel(
        id: 'p1',
        name: 'MS Adjustable Prop',
        description: 'Heavy duty steel prop for slab support',
        categoryId: 'props',
        salePrice: 450,
        rentalPricePerDay: 50,
        securityDeposit: 500,
        rating: 4.6,
        stock: 120,
        imageAsset: Assets.imageConstruction,
      ),
      ProductModel(
        id: 'p2',
        name: 'Shuttering Plate',
        description: 'MS plate for slab and beam shuttering',
        categoryId: 'plates',
        salePrice: 85,
        rentalPricePerDay: 12,
        securityDeposit: 150,
        rating: 4.4,
        stock: 400,
        imageAsset: Assets.imageConstruction,
      ),
      ProductModel(
        id: 'p3',
        name: 'Centering Plate',
        description: 'Durable centering plate for RCC work',
        categoryId: 'plates',
        salePrice: 95,
        rentalPricePerDay: 14,
        securityDeposit: 180,
        rating: 4.3,
        stock: 260,
      ),
      ProductModel(
        id: 'p4',
        name: 'MS Channel',
        description: 'Structural channel for beam support',
        categoryId: 'channels',
        salePrice: 320,
        rentalPricePerDay: 35,
        securityDeposit: 400,
        rating: 4.5,
        stock: 80,
      ),
      ProductModel(
        id: 'p5',
        name: 'Jack Prop',
        description: 'Adjustable jack prop with lock nut',
        categoryId: 'jacks',
        salePrice: 380,
        rentalPricePerDay: 40,
        securityDeposit: 450,
        rating: 4.2,
        stock: 90,
      ),
      ProductModel(
        id: 'p6',
        name: 'Base Jack',
        description: 'Solid base jack for scaffolding systems',
        categoryId: 'jacks',
        salePrice: 210,
        rentalPricePerDay: 25,
        securityDeposit: 250,
        rating: 4.1,
        stock: 150,
      ),
      ProductModel(
        id: 'p7',
        name: 'U Head',
        description: 'U-head for beam and slab centering',
        categoryId: 'accessories',
        salePrice: 160,
        rentalPricePerDay: 18,
        securityDeposit: 200,
        rating: 4.0,
        stock: 200,
      ),
      ProductModel(
        id: 'p8',
        name: 'Tie Rod',
        description: 'High tensile tie rod for wall shuttering',
        categoryId: 'accessories',
        salePrice: 75,
        rentalPricePerDay: 8,
        securityDeposit: 100,
        rating: 4.3,
        stock: 500,
      ),
      ProductModel(
        id: 'p9',
        name: 'Wing Nut',
        description: 'Cast iron wing nut for tie rod locking',
        categoryId: 'accessories',
        salePrice: 18,
        rentalPricePerDay: 2,
        securityDeposit: 30,
        rating: 4.1,
        stock: 800,
      ),
      ProductModel(
        id: 'p10',
        name: 'Cuplock Standard',
        description: 'Cuplock vertical for scaffolding towers',
        categoryId: 'scaffolding',
        salePrice: 890,
        rentalPricePerDay: 70,
        securityDeposit: 900,
        rating: 4.7,
        stock: 60,
        imageAsset: Assets.imageConstruction,
      ),
      ProductModel(
        id: 'p11',
        name: 'Scaffolding Frame',
        description: 'H-frame scaffolding for elevation work',
        categoryId: 'scaffolding',
        salePrice: 1250,
        rentalPricePerDay: 95,
        securityDeposit: 1200,
        rating: 4.5,
        stock: 40,
      ),
      ProductModel(
        id: 'p12',
        name: 'Wooden Batten',
        description: 'Seasoned wooden batten for shuttering',
        categoryId: 'plates',
        salePrice: 55,
        rentalPricePerDay: 6,
        securityDeposit: 80,
        rating: 4.0,
        stock: 300,
      ),
      ProductModel(
        id: 'p13',
        name: 'H-Beam',
        description: 'MS H-beam for heavy load support',
        categoryId: 'channels',
        salePrice: 2100,
        rentalPricePerDay: 140,
        securityDeposit: 2000,
        rating: 4.8,
        stock: 25,
      ),
      ProductModel(
        id: 'p14',
        name: 'MS Prop',
        description: 'Standard MS prop for residential sites',
        categoryId: 'props',
        salePrice: 390,
        rentalPricePerDay: 42,
        securityDeposit: 450,
        rating: 4.4,
        stock: 110,
      ),
    ];
  }

  Future<List<ProductModel>> getPopularProducts() async {
    final products = await getProducts();
    return products.take(6).toList();
  }

  Future<List<ProductModel>> getRentalProducts() async {
    final products = await getProducts();
    return products.where((p) => p.isRental).take(8).toList();
  }

  Future<List<OrderModel>> getRecentOrders() async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    return [
      OrderModel(
        id: 'SH10245',
        itemCount: 5,
        total: 8450,
        status: 'Delivered',
        createdAt: DateTime.now().subtract(const Duration(days: 3)),
      ),
      OrderModel(
        id: 'SH10212',
        itemCount: 2,
        total: 2100,
        status: 'In Transit',
        createdAt: DateTime.now().subtract(const Duration(days: 1)),
      ),
    ];
  }

  Future<List<ProductModel>> searchProducts(String query) async {
    final products = await getProducts();
    final q = query.trim().toLowerCase();
    if (q.isEmpty) return products;
    return products
        .where(
          (p) =>
              p.name.toLowerCase().contains(q) ||
              p.description.toLowerCase().contains(q),
        )
        .toList();
  }

  Future<List<LocationModel>> getLocations() async {
    return const [
      LocationModel(id: 'mohali', city: 'Mohali', state: 'Punjab'),
      LocationModel(id: 'chandigarh', city: 'Chandigarh', state: 'UT'),
      LocationModel(id: 'panchkula', city: 'Panchkula', state: 'Haryana'),
      LocationModel(id: 'ludhiana', city: 'Ludhiana', state: 'Punjab'),
    ];
  }
}
