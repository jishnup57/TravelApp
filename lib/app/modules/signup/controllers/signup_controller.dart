import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:travel_aliga/app/modules/signin/controllers/signin_controller.dart';
import 'package:travel_aliga/app/modules/signup/model/signup_model.dart';
import 'package:travel_aliga/app/routes/app_pages.dart';
import 'package:travel_aliga/app/utils/urls.dart';

class SignupController extends GetxController {
  final signUpKey = GlobalKey<FormState>();
  final firstNameControlleer = TextEditingController();
  final lastNameControlleer = TextEditingController();
  final phoneControlleer = TextEditingController();
  final emailControlleer = TextEditingController();
  final passwordControlleer = TextEditingController();
  final confirmPasswordControlleer = TextEditingController();
  var isLoading = false.obs;

  final dio = Dio(
    BaseOptions(
      baseUrl: Url.baseUrl,
    ),
  );
  onSignupButton() async {
    isLoading.value = true;
    // await Future.delayed(Duration(seconds: 3));
    if (signUpKey.currentState!.validate()) {
      final obj = SignUpModel(
        firstName: firstNameControlleer.text.trim(),
        lastName: lastNameControlleer.text.trim(),
        email: emailControlleer.text.trim(),
        phone: phoneControlleer.text.trim(),
        password: passwordControlleer.text.trim(),
        confirmPassword: confirmPasswordControlleer.text.trim(),
      );
      try {
      final response=await dio.post(Url.signup,data: obj.toJson());
      if (response.statusCode!>=200 && response.statusCode!<=299) {
        print(response.data);
        Get.toNamed(Paths.otp);
      } else {
        SigninController.showSnakBar(response.statusCode.toString());
      }
        
      }on DioError catch(e){
        log(e.response!.data.toString());
      }
       catch (e) {
        print(e.toString());
      }
      isLoading.value=false;
      
    }
  }

  String? customValidator(String? fieldContent) {
    if (fieldContent!.isEmpty) {
      isLoading.value = false;
      return 'Please fill this field';
    }

    return null;
  }

  String? passwordValidator(String? fieldContent) {
    if (fieldContent!.isEmpty) {
      isLoading.value = false;
      return 'Please fill this field';
    }
    if (fieldContent != passwordControlleer.text) {
      isLoading.value = false;
      return 'Password Not Match';
    }
    return null;
  }

  String? phoneValidator(String? fieldContent) {
    if (fieldContent!.isEmpty) {
      isLoading.value = false;
      return 'Please fill this field';
    }
    if (fieldContent.length != 10) {
      isLoading.value = false;
      return 'Invalied Phone Number';
    }
    return null;
  }
}
