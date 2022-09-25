import 'dart:async';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_aliga/app/routes/app_pages.dart';

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
        Get.offNamed(Paths.mainScreen);
      } else {
        Get.offNamed(Paths.signIn);
      }
    });
  }
}
