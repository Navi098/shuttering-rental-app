// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataResponse<TModel> _$DataResponseFromJson<TModel>(
  Map<String, dynamic> json,
  TModel Function(Object? json) fromJsonTModel,
) => DataResponse<TModel>(
  isSuccess: json['isSuccess'] as bool?,
  error: json['error'] as String?,
  message: json['message'] as String?,
  unread_notification: json['unread_notification'],
  data: _$nullableGenericFromJson(json['data'], fromJsonTModel),
  code: (json['code'] as num?)?.toInt(),
  apiStatus: json['apiStatus'] as bool?,
  main_data: _$nullableGenericFromJson(json['main_data'], fromJsonTModel),
  token: json['token'] as String?,
  hasBusiness: json['hasBusiness'] as bool?,
  is_favourite: json['is_favourite'] as bool?,
);

Map<String, dynamic> _$DataResponseToJson<TModel>(
  DataResponse<TModel> instance,
  Object? Function(TModel value) toJsonTModel,
) => <String, dynamic>{
  'isSuccess': ?instance.isSuccess,
  'is_favourite': ?instance.is_favourite,
  'unread_notification': ?instance.unread_notification,
  'error': ?instance.error,
  'message': ?instance.message,
  'data': ?_$nullableGenericToJson(instance.data, toJsonTModel),
  'main_data': ?_$nullableGenericToJson(instance.main_data, toJsonTModel),
  'code': ?instance.code,
  'apiStatus': ?instance.apiStatus,
  'token': ?instance.token,
  'hasBusiness': ?instance.hasBusiness,
};

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) => input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) => input == null ? null : toJson(input);
