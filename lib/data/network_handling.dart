import 'dart:io';
import 'package:dio/dio.dart';

class NetworkHandling {
  static String messageData = "";

  static getDioException(error) {
    if (error is Exception) {
      try {
        if (error is DioException) {
          if (error.response?.data != null &&
              error.response?.data is Map<String, dynamic>) {
            messageData = error.response?.data['message'] ??
                error.response?.data['error'] ??
                "";

            if (messageData.isNotEmpty) {
              return messageData;
            }
          }
          messageData = error.message ?? "";
          switch (error.type) {
            case DioExceptionType.cancel:
              return messageData =
              "The request was cancelled. Please try again.";
            case DioExceptionType.connectionTimeout:
              return messageData =
              "Unable to connect. Please check your internet connection and try again.";
            case DioExceptionType.unknown:
              return messageData = 'Unknown';
            case DioExceptionType.receiveTimeout:
              return messageData =
              'Oops! It’s taking longer than expected to get a response. Please try again soon.';
            case DioExceptionType.badResponse:
              switch (error.response!.statusCode) {
                case 400:
                  return messageData = 'Invalid request. Please check and try again.';
                case 401:
                  return messageData = 'Session expired. Please log in again.';
                case 403:
                  return messageData = 'Session expired. Please log in again.';
                case 404:
                  return messageData = 'Service not found. Please try again later.';
                case 408:
                  return messageData = 'The request took too long. Please try again.';
                case 500:
                  return messageData = 'We’re experiencing a server issue. Please try again shortly.';
                case 502:
                  return messageData = 'The LitLearn server is temporarily unavailable. Please try again later.';
                case 503:
                  return messageData = 'The service is currently under maintenance. Please try again soon.';
                case 504:
                  return messageData = 'The server took too long to respond. Please try again.';
                case 508:
                  return messageData = 'The request could not be completed due to a server issue. Please try again later.';
                case 522:
                  return messageData =
                  'The server is taking longer than expected to respond. Please try again in a moment.';
                default:
                  return messageData = 'Unable to connect to the server. Please try again later.';
              }
            case DioExceptionType.sendTimeout:
              return messageData = 'The request timed out while sending data. Please check your connection.';
            case DioExceptionType.badCertificate:
              return messageData = 'Security issue with the server. Please try again later.';
            case DioExceptionType.badResponse:
              return messageData = 'Bad Response';
            case DioExceptionType.connectionError:
              return messageData = 'Network connection issue. Please check your internet.';
            case DioExceptionType.transformTimeout:
              // TODO: Handle this case.
              throw UnimplementedError();
          }
        } else if (error is SocketException) {
          return messageData = 'No internet connection. Please check your network and try again.';
        } else {
          return messageData = 'An unexpected error occurred. Please try again.';
        }
      } on FormatException catch (_) {
        return messageData = 'Invalid response format from server.';
      } catch (_) {
        return messageData = 'An unexpected error occurred. Please try again.';
      }
    } else {
      return messageData = 'An error occurred. Please try again.';
    }
  }
}
