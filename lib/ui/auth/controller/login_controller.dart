
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shuttring_hub/data/api_provider/auth_api_provider.dart';
import 'package:shuttring_hub/data/model/user_model.dart';
import 'package:shuttring_hub/data/shared/data_response.dart';
import 'package:shuttring_hub/utils/app_routes.dart';
import 'package:shuttring_hub/utils/utils.dart';

class LoginController extends GetxController{

  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  late AuthApiProvider _authApiProvider;

  @override
  void onInit(){
    _authApiProvider = AuthApiProvider();
    super.onInit();
  }

  Future<void> login() async {
    try {
      if(!await Utils.hasNetwork()) return;
      final Map<String, dynamic> body = {
        "phone": phoneController.text.trim(),
        "password": passwordController.text.trim(),
      };
      final DataResponse<UserModel?> dataResponse =
      await _authApiProvider.login(body);
      if (dataResponse.isSuccess == false) {
        Utils.showSnackBar(dataResponse.message);
        return;
      }
      Get.offAllNamed(AppRoutes.mainView);
    } catch (e, stackTrace) {
      debugPrint("Verify OTP Error: $e");
      debugPrintStack(stackTrace: stackTrace);
    }
  }
}