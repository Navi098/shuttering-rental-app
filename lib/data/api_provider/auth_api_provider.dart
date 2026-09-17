
import 'package:dio/dio.dart';
import 'package:shuttring_hub/data/api_provider/api_constant.dart';
import 'package:shuttring_hub/data/injector.dart';
import 'package:shuttring_hub/data/model/user_model.dart';
import 'package:shuttring_hub/data/shared/data_response.dart';

import '../network_handling.dart' show NetworkHandling;

class AuthApiProvider {
  late Dio _dio;

  AuthApiProvider() {
    _dio = Injector().getDio();
  }

  Future<DataResponse<UserModel?>> signUp(Map<String,dynamic> data) async {
    try {
      Response response = await _dio.post(ApiConstants.signUp, data: data);
      var dataResponse = DataResponse<UserModel>.fromJson(response.data,
              (data) => UserModel.fromJson(data as Map<String, dynamic>));
      return dataResponse;
    } catch (e) {
      return DataResponse(
          message: NetworkHandling.getDioException(e), isSuccess: false);
    }
  }

  Future<DataResponse<UserModel?>> verifyOtp(Map<String,dynamic> data) async {
    try {
      Response response = await _dio.post(ApiConstants.verifyOtp, data: data);
      var dataResponse = DataResponse<UserModel>.fromJson(response.data,
              (data) => UserModel.fromJson(data as Map<String, dynamic>));
      return dataResponse;
    } catch (e) {
      return DataResponse(
          message: NetworkHandling.getDioException(e), isSuccess: false);
    }
  }

  Future<DataResponse<UserModel?>> login(Map<String,dynamic> data) async {
    try {
      Response response = await _dio.post(ApiConstants.login, data: data);
      var dataResponse = DataResponse<UserModel>.fromJson(response.data,
              (data) => UserModel.fromJson(data as Map<String, dynamic>));
      return dataResponse;
    } catch (e) {
      return DataResponse(
          message: NetworkHandling.getDioException(e), isSuccess: false);
    }
  }
}