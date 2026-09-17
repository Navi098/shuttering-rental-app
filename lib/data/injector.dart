import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/material.dart';


class Injector {
  static final Injector _singleton = Injector._internal();
  static final _dio = Dio();

  factory Injector() {
    return _singleton;
  }

  Injector._internal();

  Dio getDio() {
    BaseOptions options = BaseOptions(
      receiveTimeout: const Duration(seconds:120),
      connectTimeout: const Duration(seconds: 120),
    );
    _dio.options = options;
    _dio.options.followRedirects = false;
    _dio.options.headers["Content-Type"] = "application/json";
    (_dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    _dio.interceptors.clear();
    _dio.interceptors.add(LoggingInterceptors());
    // dio.interceptors.add(LogInterceptor(responseBody: false)); //开启请求日志
    return _dio;
  }

//   static Options? getHeaderToken() {
//     // String? token = StorageHelper().getUserToken();
//     // if (token != null) {
//     //   debugPrint("token=$token");
//     //   var userId = StorageHelper().getUserId();
//     //   if (userId != null) {
//     //     debugPrint("userId=$userId");
//     //   }
//       var headerOptions = Options(headers: {
//         'x-access-token': token,
//        // 'x-app-version': AppInfoService.getAppVersion(),
//         'x-platform': Platform.isAndroid ? "android" : "ios",
//       });
//       return headerOptions;
//     }
//     return null;
//   }
}

class LoggingInterceptors extends Interceptor {
  String printObject(Object object) {
    // Encode your object and then decode your object to Map variable
    Map jsonMapped = json.decode(json.encode(object));

    // Using JsonEncoder for spacing
    JsonEncoder encoder = const JsonEncoder.withIndent('  ');

    // encode it to string
    String prettyPrint = encoder.convert(jsonMapped);
    return prettyPrint;
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint(
        "--> ${options.method.toUpperCase()} ${"${options.baseUrl}${options.path}"}");
    debugPrint("Headers:");
    options.headers.forEach((k, v) => print('$k: $v'));
    debugPrint("queryParameters:");
    options.queryParameters.forEach((k, v) => print('$k: $v'));
    if (options.data != null) {
      try {
        // print("Body: ${printObject(options.data)}");
        FormData formData = options.data as FormData;
        debugPrint("Body:");
        var buffer = [];
        for (MapEntry<String, String> pair in formData.fields) {
          buffer.add('${pair.key}:${pair.value}');
        }
        debugPrint("Body:{${buffer.join(', ')}}");
      } catch (e) {
        debugPrint("Body: ${printObject(options.data)}");
      }
    }
    debugPrint(
        "--> END ${options.method != null ? options.method.toUpperCase() : 'METHOD'}");
    return super.onRequest(options, handler);
  }


  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final requestOptions = err.requestOptions;
    final url = '${requestOptions.baseUrl}${requestOptions.path}';

    if (err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.receiveTimeout ||
        err.type == DioExceptionType.sendTimeout) {
      debugPrint("TimeOutOccurredForAPI: $url");
    }

    debugPrint("<-- ${err.message} $url");
    debugPrint("${err.response?.data ?? 'Unknown Error'}");
    debugPrint("<-- End error");
    debugPrint("dio error status code: ${err.response?.statusCode}");

    if (err.response?.statusCode == 401) {
     // Utils.showSnackBarSuccess(err.response?.data['message']);
      //StorageHelper().clearAll();
      //Get.offAllNamed(Routes.welcomeScreen);
    }

    super.onError(err, handler);
  }


  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint(
        "<-- ${response.statusCode} ${(response.requestOptions != null ? (response.requestOptions.baseUrl + response.requestOptions.path) : 'URL')}");
    debugPrint("Headers:");
    response.headers.forEach((k, v) => debugPrint('$k: $v'));
    debugPrint("Response: ${response.data}");
    debugPrint("<-- END HTTP");
    return super.onResponse(response, handler);
  }
}