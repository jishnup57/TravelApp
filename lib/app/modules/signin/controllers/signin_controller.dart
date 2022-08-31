import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_aliga/app/modules/home/views/home_view.dart';
import 'package:travel_aliga/app/modules/signin/model/signin_model.dart';
import 'package:travel_aliga/app/modules/signin/model/token_model.dart';
import 'package:travel_aliga/app/utils/urls.dart';
class SigninController extends GetxController  {
  static TextEditingController emailController = TextEditingController();
  static TextEditingController passwordController = TextEditingController();
  Future<void> onSubmit() async {
    final email = emailController.text;
    final password = passwordController.text;
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
        final value=TokenModel.fromJson(result.data);
        print(value.token);
       Get.off(() =>  HomeView());
      }
    } on DioError catch (e) {
      log(e.error.toString());
    } catch (e) {
      log(e.toString());
    }
  }


}


