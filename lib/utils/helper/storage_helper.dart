
import 'dart:convert';

import 'package:get_storage/get_storage.dart' show GetStorage;
import 'package:shuttring_hub/data/model/user_model.dart';

class StorageHelper {
  static final GetStorage _storage = GetStorage();
  static const JsonDecoder _decoder = JsonDecoder();
  static const JsonEncoder _encoder = JsonEncoder.withIndent('  ');

  static const String _userModel = "userModel";
  static const String _userToken = "userToken";


  _savePref(String key, Object? value) async {
    var prefs = GetStorage();
    prefs.write(key, value);
  }

  T _getPref<T>(String key) {
    return GetStorage().read(key) as T;
  }

  void saveUserModel(UserModel? userModel) {
    if (userModel != null) {
      String value = _encoder.convert(userModel.toJson());
      _savePref(_userModel, value);
    } else {
      _savePref(_userModel, null);
    }
  }

  UserModel? getUserModel() {
    String? user = _getPref(_userModel);
    if (user != null) {
      Map<String, dynamic> userMap = _decoder.convert(user);
      return UserModel.fromJson(userMap);
    } else {
      return null;
    }
  }

  Future<void> saveToken(String token) async {
    await _storage.write(_userToken, token);
  }
  String? getToken() {
    return _storage.read<String>(_userToken);
  }
}