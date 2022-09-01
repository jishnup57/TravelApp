import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_aliga/app/modules/home/views/home_view.dart';
import 'package:travel_aliga/app/modules/signin/model/signin_model.dart';
import 'package:travel_aliga/app/modules/signin/model/token_model.dart';
import 'package:travel_aliga/app/utils/style.dart';
import 'package:travel_aliga/app/utils/urls.dart';

class SigninController extends GetxController {
  final signUpKey = GlobalKey<FormState>();
  static TextEditingController emailController = TextEditingController();
  static TextEditingController passwordController = TextEditingController();
  Future<void> onSubmit() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    if (password.isEmpty || email.isEmpty) {
      showSnakBar('All fields are Requires');
      return;
    }
    final obj = SignInModel(email: email, password: password);
    final dio = Dio(
      BaseOptions(
        baseUrl: Url.baseUrl,
      ),
    );
    try {
      final result = await dio.post(Url.login, data: obj.toJson());
      if (result.statusCode! >= 200 || result.statusCode! <= 299) {
        print(result.data);
        final value = TokenModel.fromJson(result.data);
        print(value.token);
        Get.off(() => HomeView());
      }
    } on DioError catch (e) {
      showSnakBar(e.error);
      log(e.error.toString());
    } catch (e) {
      showSnakBar('Unable to connect');
      log(e.toString());
    }
  }

  bool secure = true;
  changeVisibility() {
    secure = !secure;
    update();
  }

  int count = 0;
  increment() {
    count++;
    update();
  }

  showSnakBar(String message) {
    Get.snackbar(
      "Error",
      '',
      snackPosition: SnackPosition.BOTTOM,
      icon:Icon(Icons.warning_amber_outlined,color: Colors.yellow,) ,
      messageText: Text(message,style: AppStyle.kCardTextStyle.copyWith(fontSize: 14),),
      backgroundColor: Colors.red,
      borderRadius: 10,
      margin: EdgeInsets.all( 10),
      colorText: Colors.white,
    );
  }
}