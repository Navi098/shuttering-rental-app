// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
  id: json['id'] as String?,
  name: json['name'] as String?,
  email: json['email'] as String?,
  pinCode: json['pinCode'] as String?,
  city: json['city'] as String?,
  password: json['password'] as String?,
  createdAt: json['createdAt'] as String?,
  updatedAt: json['updatedAt'] as String?,
  imgUrl: json['imgUrl'] as String?,
  activationCode: json['activationCode'] as String?,
  businessName: json['businessName'] as String?,
  authTokenId: json['authTokenId'] as String?,
  accessToken: json['accessToken'] as String?,
  refreshToken: json['refreshToken'] as String?,
  role: json['role'] as String?,
  isStoreHidden: json['isStoreHidden'] as bool?,
  authMethod: json['authMethod'] as String?,
  session: json['session'] == null
      ? null
      : UserModel.fromJson(json['session'] as Map<String, dynamic>),
  user: json['user'] == null
      ? null
      : User.fromJson(json['user'] as Map<String, dynamic>),
  deviceType: json['deviceType'] as String?,
  bio: json['bio'] as String?,
  phone: json['phone'] as String?,
  supportEmail: json['supportEmail'] as String?,
  otp: json['otp'] as String?,
);

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
  'id': ?instance.id,
  'name': ?instance.name,
  'email': ?instance.email,
  'createdAt': ?instance.createdAt,
  'imgUrl': ?instance.imgUrl,
  'authMethod': ?instance.authMethod,
  'password': ?instance.password,
  'pinCode': ?instance.pinCode,
  'city': ?instance.city,
  'updatedAt': ?instance.updatedAt,
  'activationCode': ?instance.activationCode,
  'authTokenId': ?instance.authTokenId,
  'businessName': ?instance.businessName,
  'accessToken': ?instance.accessToken,
  'refreshToken': ?instance.refreshToken,
  'role': ?instance.role,
  'deviceType': ?instance.deviceType,
  'isStoreHidden': ?instance.isStoreHidden,
  'session': ?instance.session?.toJson(),
  'bio': ?instance.bio,
  'supportEmail': ?instance.supportEmail,
  'phone': ?instance.phone,
  'user': ?instance.user?.toJson(),
  'otp': ?instance.otp,
};

User _$UserFromJson(Map<String, dynamic> json) => User(
  id: json['id'] as String?,
  name: json['name'] as String?,
  createdAt: json['createdAt'] as String?,
  phone: json['phone'] as String?,
  role: json['role'] as String?,
);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  'id': ?instance.id,
  'name': ?instance.name,
  'phone': ?instance.phone,
  'role': ?instance.role,
  'createdAt': ?instance.createdAt,
};
