import 'package:get/get.dart';

import 'package:travel_aliga/app/modules/home/bindings/home_binding.dart';
import 'package:travel_aliga/app/modules/home/views/home_view.dart';
import 'package:travel_aliga/app/modules/otp/bindings/otp_binding.dart';
import 'package:travel_aliga/app/modules/otp/views/otp_view.dart';
import 'package:travel_aliga/app/modules/signin/bindings/signin_binding.dart';
import 'package:travel_aliga/app/modules/signin/views/signin_view.dart';
import 'package:travel_aliga/app/modules/signup/bindings/signup_binding.dart';
import 'package:travel_aliga/app/modules/signup/views/signup_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.signIn;

  static final routes = [
    GetPage(
      name: Paths.home,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Paths.signIn,
      page: () => SigninView(),
      binding: SigninBinding(),
    ),
    GetPage(
      name: Paths.signUp,
      page: () => SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: Paths.otp,
      page: () => OtpView(),
      binding: OtpBinding(),
    ),
  ];
}
