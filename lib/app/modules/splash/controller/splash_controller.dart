import 'dart:async';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_aliga/app/modules/mainscreen/views/mainscreen_view.dart';
import 'package:travel_aliga/app/modules/signin/views/signin_view.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    checkLogined();
  }

  checkLogined() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    bool isLogined = pref.getBool("isLogined") ?? false;

    log(isLogined.toString());
    Timer(Duration(seconds: 3), () {
      if (isLogined) {
        Get.off(MainscreenView());
      } else {
        Get.off(SigninView());
      }
    });
  }
}
