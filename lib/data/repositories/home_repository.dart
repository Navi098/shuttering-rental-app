import 'package:shuttring_hub/data/models/banner_model.dart';
import 'package:shuttring_hub/data/models/category_model.dart';
import 'package:shuttring_hub/data/models/location_model.dart';
import 'package:shuttring_hub/data/models/order_model.dart';
import 'package:shuttring_hub/data/models/product_model.dart';
import 'package:shuttring_hub/data/providers/home_local_data_source.dart';

class HomeRepository {
  HomeRepository({HomeLocalDataSource? dataSource})
      : _dataSource = dataSource ?? HomeLocalDataSource();

  final HomeLocalDataSource _dataSource;

  Future<List<CategoryModel>> getCategories() => _dataSource.getCategories();

  Future<List<BannerModel>> getBanners() => _dataSource.getBanners();

  Future<List<ProductModel>> getPopularProducts() =>
      _dataSource.getPopularProducts();

  Future<List<ProductModel>> getRentalProducts() =>
      _dataSource.getRentalProducts();

  Future<List<ProductModel>> getProducts() => _dataSource.getProducts();

  Future<List<OrderModel>> getRecentOrders() => _dataSource.getRecentOrders();

  Future<List<ProductModel>> searchProducts(String query) =>
      _dataSource.searchProducts(query);

  Future<List<LocationModel>> getLocations() => _dataSource.getLocations();
}
