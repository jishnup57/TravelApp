import 'package:get/get.dart';

import 'package:travel_aliga/app/modules/Favorate/bindings/favorate_binding.dart';
import 'package:travel_aliga/app/modules/Favorate/views/favorate_view.dart';
import 'package:travel_aliga/app/modules/Settings/bindings/settings_binding.dart';
import 'package:travel_aliga/app/modules/Settings/views/settings_view.dart';
import 'package:travel_aliga/app/modules/home/views/home_view.dart';
import 'package:travel_aliga/app/modules/mainscreen/bindings/mainscreen_binding.dart';
import 'package:travel_aliga/app/modules/mainscreen/views/mainscreen_view.dart';
import 'package:travel_aliga/app/modules/otp/bindings/otp_binding.dart';
import 'package:travel_aliga/app/modules/otp/views/otp_view.dart';
import 'package:travel_aliga/app/modules/search/bindings/search_binding.dart';
import 'package:travel_aliga/app/modules/search/views/search_view.dart';
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
    GetPage(
      name: Routes.MAINSCREEN,
      page: () => MainscreenView(),
      binding: MainscreenBinding(),
    ),
    GetPage(
      name: Routes.SEARCH,
      page: () => SearchView(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: Routes.FAVORATE,
      page: () => FavorateView(),
      binding: FavorateBinding(),
    ),
    GetPage(
      name: Routes.SETTINGS,
      page: () => SettingsView(),
      binding: SettingsBinding(),
    ),
  ];
}
