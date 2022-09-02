import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  final signUpKey = GlobalKey<FormState>();
  final firstNameControlleer = TextEditingController();
  final lastNameControlleer = TextEditingController();
  final phoneControlleer = TextEditingController();
  final emailControlleer = TextEditingController();
  final passwordControlleer = TextEditingController();
  final confirmPasswordControlleer = TextEditingController();
  var isLoading = false.obs;
  onSignupButton() async {
    isLoading.value = true;
    await Future.delayed(Duration(seconds: 3));
    if (signUpKey.currentState!.validate()) {
      return;
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
      isLoading.value=false;
      return 'Please fill this field';
    }
    if (fieldContent != passwordControlleer.text) {
      isLoading.value=false;
      return 'Password Not Match';
    }
    return null;
  }

  String? phoneValidator(String? fieldContent) {

    if (fieldContent!.isEmpty) {
      isLoading.value=false;
      return 'Please fill this field';
    }
    if (fieldContent.length != 10) {
      isLoading.value=false;
      return 'Invalied Phone Number';
    }
    return null;
  }
}
