import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:travel_aliga/app/modules/signup/api_service/api_service.dart';
import 'package:travel_aliga/app/modules/signup/model/signup_model.dart';
import 'package:travel_aliga/app/routes/app_pages.dart';
import 'package:travel_aliga/app/utils/error_dialog.dart';
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

    if (signUpKey.currentState!.validate()) {
      final obj = SignUpModel(
        firstName: firstNameControlleer.text.trim(),
        lastName: lastNameControlleer.text.trim(),
        email: emailControlleer.text.trim(),
        phone: phoneControlleer.text.trim(),
        password: passwordControlleer.text.trim(),
        confirmPassword: confirmPasswordControlleer.text.trim(),
      );

      final response = await ApiSignUp().registerUser(obj);
      isLoading.value = false;
      if(response != null){
          if(response.email != null){
            log(response.toJson().toString());
            Get.toNamed(Paths.otp,arguments: response.phone.toString());
          }else{
            ErrorDialoge.showSnakBar(response.message.toString());
          }
      }else{
         ErrorDialoge.showSnakBar("No network");
      }
    }
  }




  String? firstNameValidator(String? fieldContent,) {
    if (fieldContent!.isEmpty) {
      isLoading.value = false;
      return 'Enter First Name';
    }

    return null;
  }
  String? lastNameValidator(String? fieldContent,) {
    if (fieldContent!.isEmpty) {
      isLoading.value = false;
      return 'Enter Last Name';
    }

    return null;
  }
  String? emailValidator(String? fieldContent,) {
    if (fieldContent!.isEmpty) {
      isLoading.value = false;
      return 'Enter Email';
    }

    return null;
  }
  String? passwordValidator(String? fieldContent,) {
    if (fieldContent!.isEmpty) {
      isLoading.value = false;
      return 'Enter Password';
    }

    return null;
  }

  String? confirmPasswordValidator(String? fieldContent) {
    if (fieldContent!.isEmpty) {
      isLoading.value = false;
      return 'Enter Confirm Password';
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
      return 'Enter Phone Number';
    }
    if (fieldContent.length != 10) {
      isLoading.value = false;
      return 'Invalied Phone Number';
    }
    return null;
  }

  @override
  void onClose() {
    firstNameControlleer.dispose();
    lastNameControlleer.dispose();
    phoneControlleer.dispose();
    emailControlleer.dispose();
    passwordControlleer.dispose();
    confirmPasswordControlleer.dispose();
    super.onClose();
  }
}
