
import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';

@JsonSerializable(includeIfNull: false,explicitToJson: true)
class UserModel{
  String? id;
  String? name;
  String? email;
  String? createdAt;
  String? imgUrl;
  String? authMethod;
  String? password;
  String? pinCode;
  String? city;
  String? updatedAt;
  String? activationCode;
  String? authTokenId;
  String? businessName;
  String? accessToken;
  String? refreshToken;
  String? role;
  String? deviceType;
  bool? isStoreHidden;
  UserModel? session;
  String? bio;
  String? supportEmail;
  String? phone;
  User? user;
  String? otp;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.pinCode,
    this.city,
    this.password,
    this.createdAt,
    this.updatedAt,
    this.imgUrl,
    this.activationCode,
    this.businessName,
    this.authTokenId,
    this.accessToken,
    this.refreshToken,
    this.role,
    this.isStoreHidden,
    this.authMethod,
    this.session,
    this.user,
    this.deviceType,
    this.bio,
    this.phone,
    this.supportEmail,
    this.otp,
});

  factory UserModel.fromJson(Map<String,dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String,dynamic> toJson()=> _$UserModelToJson(this);
}
@JsonSerializable(includeIfNull: false, explicitToJson: true)
class User{
  String? id;
  String? name;
  String? phone;
  String? role;
  String? createdAt;

  User({
    this.id,
    this.name,
    this.createdAt,
    this.phone,
    this.role,
});
  factory User.fromJson(Map<String,dynamic> json) =>
      _$UserFromJson(json);
  Map<String,dynamic> toJson()=> _$UserToJson(this);
}