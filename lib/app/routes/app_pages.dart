import 'package:get/get.dart';

import 'package:travel_aliga/app/modules/Favorate/bindings/favorate_binding.dart';
import 'package:travel_aliga/app/modules/Favorate/views/favorate_view.dart';
import 'package:travel_aliga/app/modules/Settings/views/settings_view.dart';
import 'package:travel_aliga/app/modules/home/views/home_view.dart';
import 'package:travel_aliga/app/modules/mainscreen/bindings/mainscreen_binding.dart';
import 'package:travel_aliga/app/modules/mainscreen/views/mainscreen_view.dart';
import 'package:travel_aliga/app/modules/otp/bindings/otp_binding.dart';
import 'package:travel_aliga/app/modules/otp/views/otp_view.dart';
import 'package:travel_aliga/app/modules/search/views/search_view.dart';
import 'package:travel_aliga/app/modules/signin/views/signin_view.dart';
import 'package:travel_aliga/app/modules/signup/views/signup_view.dart';
import 'package:travel_aliga/app/modules/splash/view/splash_view.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.splash;

  static final routes = [
    GetPage(
      name: Paths.splash,
      page: () => SplashView(),
    ),
    GetPage(
      name: Paths.home,
      page: () => HomeView(),
    ),
    //  GetPage(
    //   name: Paths.item,
    //   page: () => ItemView(item: null),
    // ),
    GetPage(
      name: Paths.signIn,
      page: () => SigninView(),
    ),
    GetPage(
      name: Paths.signUp,
      page: () => SignupView(),
   
    ),
    GetPage(
      name: Paths.otp,
      page: () => OtpView(),
      binding: OtpBinding(),
    ),
    GetPage(
      name: Routes.mainScreen,
      page: () => MainscreenView(),
      binding: MainscreenBinding(),
    ),
    GetPage(
      name: Routes.search,
      page: () => SearchView(),

    ),
    GetPage(
      name: Routes.favorate,
      page: () => FavorateView(),
      binding: FavorateBinding(),
    ),
    GetPage(
      name: Routes.settings,
      page: () => SettingsView(),
    ),
  ];
}

