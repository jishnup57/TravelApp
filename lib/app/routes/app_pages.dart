import 'package:get/get.dart';

import 'package:travel_aliga/app/modules/home/bindings/home_binding.dart';
import 'package:travel_aliga/app/modules/home/views/home_view.dart';
import 'package:travel_aliga/app/modules/signin/bindings/signin_binding.dart';
import 'package:travel_aliga/app/modules/signin/views/signin_view.dart';
import 'package:travel_aliga/app/modules/signup/bindings/signup_binding.dart';
import 'package:travel_aliga/app/modules/signup/views/signup_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.signUp;

  static final routes = [
    GetPage(
      name: _Paths.home,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.signIn,
      page: () => SigninView(),
      binding: SigninBinding(),
    ),
    GetPage(
      name: _Paths.signUp,
      page: () => SignupView(),
      binding: SignupBinding(),
    ),
  ];
}
