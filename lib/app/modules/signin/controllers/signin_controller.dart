import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_aliga/app/modules/signin/model/signin_model.dart';
import 'package:travel_aliga/app/modules/signin/model/token_model.dart';
import 'package:travel_aliga/app/modules/signin/service/api_service.dart';
import 'package:travel_aliga/app/routes/app_pages.dart';
import 'package:travel_aliga/app/utils/error_dialog.dart';

class SigninController extends GetxController {
  final signUpKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var isLoading = false.obs;
  Future<void> onSubmit(BuildContext ctx) async {
    isLoading.value = true;
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    if (password.isEmpty || email.isEmpty) {
      ErrorDialoge.showSnakBar('All fields are Requires');
      isLoading.value = false;
      return;
    }
    final obj = SignInModel(email: email, password: password);
    final response = await Api().getUser(obj);
    isLoading.value = false;
    if (response != null) {
      if (response.token != null) {
        addToSecureStorage(response);
        setLogined();
        log(response.toJson().toString());
        Get.offAllNamed(Paths.mainScreen);
      } else {
        ErrorDialoge.showSnakBar(response.message.toString());
      }
    } else {
      ErrorDialoge.showSnakBar("No network");
    }
  }

  bool secure = true;
  changeVisibility() {
    secure = !secure;
    update();
  }

  Future<void> addToSecureStorage(TokenModel value) async {
    FlutterSecureStorage secureStorage = FlutterSecureStorage();
    // AndroidOptions secureOptions = AndroidOptions(encryptedSharedPreferences:true );
    await secureStorage.write(
      key: "Token",
      value: value.token,
      // aOptions: secureOptions,
    );
    await secureStorage.write(
      key: "refreshToken",
      value: value.refresh,
      //  aOptions: secureOptions,
    );
  }

  setLogined() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool("isLogined", true);
  }
}
