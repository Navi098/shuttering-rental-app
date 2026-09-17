import 'package:get/route_manager.dart';
import 'package:shuttring_hub/ui/active_rentals/views/active_rental_view.dart';
import 'package:shuttring_hub/ui/auth/bindings/login_binding.dart';
import 'package:shuttring_hub/ui/auth/bindings/sign_up_binding.dart';
import 'package:shuttring_hub/ui/auth/bindings/verify_otp_binding.dart';
import 'package:shuttring_hub/ui/auth/views/forgot_view.dart';
import 'package:shuttring_hub/ui/auth/views/login_view.dart';
import 'package:shuttring_hub/ui/auth/views/reset_password_view.dart';
import 'package:shuttring_hub/ui/auth/views/sign_up_view.dart';
import 'package:shuttring_hub/ui/auth/views/verify_otp_view.dart';
import 'package:shuttring_hub/ui/customers/views/customer_details_view.dart';
import 'package:shuttring_hub/ui/inventory/views/add_material_view.dart';
import 'package:shuttring_hub/ui/main/bindings/main_binding.dart';
import 'package:shuttring_hub/ui/main/views/main_screen_view.dart';
import 'package:shuttring_hub/ui/notifications/views/notification_view.dart';
import 'package:shuttring_hub/ui/onboarding/binding/onbording_binding.dart';
import 'package:shuttring_hub/ui/onboarding/view/onboarding_view.dart';
import 'package:shuttring_hub/ui/profile/views/edit_profile_view.dart';
import 'package:shuttring_hub/ui/profile/views/profile_view.dart';
import 'package:shuttring_hub/ui/rentals/bindings/rental_binding.dart';
import 'package:shuttring_hub/ui/rentals/views/rental_add_customer_view.dart';
import 'package:shuttring_hub/ui/rentals/views/rental_show_material.dart';
import 'package:shuttring_hub/ui/rentals/views/rental_view.dart';
import 'package:shuttring_hub/ui/rentals/views/select_material_view.dart';
import 'package:shuttring_hub/utils/app_routes.dart';

import '../ui/inventory/bindings/inventory_binding.dart';

class AppPages {
  static final routes = [
      GetPage(
        name: AppRoutes.loginView,
        page: ()=> LoginView(),
        binding: LoginBinding()
      ),
    GetPage(
      name: AppRoutes.mainView,
      page: ()=> MainScreenView(),
      binding: MainBinding()
    ),
    GetPage(
      name: AppRoutes.rentalView,
      page: ()=> RentalView(),
      binding: RentalBinding(),
    ),
    GetPage(
      name: AppRoutes.selectMaterialView,
      page: ()=> SelectMaterialView(),
      // binding: (),
    ),
    GetPage(
      name: AppRoutes.rentalShowMaterial,
      page: ()=> RentalShowMaterial(),
      // binding: (),
    ),
    GetPage(
      name: AppRoutes.signUpView,
      page: ()=> SignUpView(),
      binding: SignUpBinding()
    ),
    GetPage(
      name: AppRoutes.forgotView,
      page: ()=> ForgotView(),
    ),
    GetPage(
      name: AppRoutes.verifyOtp,
      page: ()=> VerifyOtpView(),
      binding: VerifyOtpBinding(),
    ),
    GetPage(name: AppRoutes.resetPasswordView, page:()=> ResetPasswordView()),
    GetPage(
      name: AppRoutes.profileView,
      page: ()=> ProfileView(),
    ),
    GetPage(
      name: AppRoutes.editProfileView,
      page: ()=> EditProfileView(),
    ),
    GetPage(
      name: AppRoutes.activeRentalView,
      page: ()=> ActiveRentalView(),
    ),
    GetPage(
      name: AppRoutes.notificationView,
      page: ()=> NotificationView(),
    ),
    GetPage(
      name: AppRoutes.customerDetailsView,
      page: ()=> CustomerDetailsView(),
    ),
    GetPage(
      name: AppRoutes.addMaterialView,
      page: ()=>AddMaterialView(),
      binding: InventoryBinding(),
    ),
    GetPage(
      name: AppRoutes.onboardingView,
      page: ()=>  OnboardingView(),
      binding: OnbordingBinding(),
    ),
    GetPage(
      name: AppRoutes.rentalAddCustomer,
      page: ()=> RentalAddCustomerView(),
    )
  ];
}