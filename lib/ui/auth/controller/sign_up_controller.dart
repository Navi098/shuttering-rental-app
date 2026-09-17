
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:shuttring_hub/data/api_provider/auth_api_provider.dart';
import 'package:shuttring_hub/data/model/user_model.dart';
import 'package:shuttring_hub/data/shared/data_response.dart';
import 'package:shuttring_hub/utils/app_routes.dart';
import 'package:shuttring_hub/utils/utils.dart';

class SignUpController extends GetxController{

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  late AuthApiProvider _authApiProvider;


  @override
  void onInit(){
    _authApiProvider = AuthApiProvider();
    super.onInit();
  }

  Future<void> signUp() async {
    try {
      if (!await Utils.hasNetwork()) return;
      final fullName = nameController.text.trim();
      final phone = phoneController.text.trim();
      final password = passwordController.text.trim();
      final confirmPassword = confirmPasswordController.text.trim();
      final Map<String, dynamic> body = {
        "name": fullName,
        "phone": phone,
        "password": password,
        "confirmPassword":confirmPassword,
      };
      final DataResponse<UserModel?> dataResponse =
      await _authApiProvider.signUp(body);
      if (dataResponse.isSuccess == false) {
        Utils.showSnackBar(dataResponse.message);
        return;
      }else{
        UserModel userModel = dataResponse.data!;
        Get.toNamed(
          AppRoutes.verifyOtp,
          arguments: {
            "phone": phone,
             "otp": userModel.otp,
          }
        );
      }
    } catch (e, stackTrace) {
      debugPrint("SignUp Error: $e");
      debugPrintStack(stackTrace: stackTrace);
    }
  }
}