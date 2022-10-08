import 'dart:async';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_aliga/app/routes/app_pages.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    checkLogined();
  }

  checkLogined() async {
    bool hasExpired = false;
    SharedPreferences pref = await SharedPreferences.getInstance();
    FlutterSecureStorage secureStorage = FlutterSecureStorage();
    String? refreshToken = await secureStorage.read(key: "refreshToken");
    
    if(refreshToken == null){
      Get.offNamed(Paths.signIn);
      return;
    }else{
       hasExpired = JwtDecoder.isExpired(refreshToken);
       print(hasExpired);
    }
    
    bool isLogined = pref.getBool("isLogined") ?? false;

    log(isLogined.toString());
    Timer(Duration(milliseconds: 1200), () {
      if (isLogined) {
        if (!hasExpired) {
          Get.offNamed(Paths.mainScreen);
        } else {
          Get.offNamed(Paths.signIn);
        }
      } else {
        Get.offNamed(Paths.signIn);
      }
    });
  }
}
