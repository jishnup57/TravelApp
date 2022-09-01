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
  onSignupButton()async{
     if (signUpKey.currentState!.validate()) {
      return ;
    }
  }
}
