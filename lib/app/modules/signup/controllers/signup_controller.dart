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
  onSignupButton() async {
    if (signUpKey.currentState!.validate()) {
      return;
    }
  }

  String? customValidator(String? fieldContent) {
    return fieldContent!.isEmpty ? 'Please fill this field' : null;
  }

  String? passwordValidator(String? fieldContent) {
    if (fieldContent!.isEmpty) {
      return 'Please fill this field';
    }
    if (fieldContent != passwordControlleer.text) {
      return 'Password Not Match';
    }
    return null;
  }
  String? phoneValidator(String? fieldContent) {
    if (fieldContent!.isEmpty) {
      return 'Please fill this field';
    }
    if (fieldContent.length!=10) {
      return 'Invalied Phone Number';
    }
    return null;
  }




}
