import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:travel_aliga/app/modules/signin/views/widget/textfield.dart';
import 'package:travel_aliga/app/utils/colors.dart';
import 'package:travel_aliga/app/utils/style.dart';

import '../controllers/signin_controller.dart';

class SigninView extends GetView<SigninController> {
  @override
  Widget build(BuildContext context) {
 return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: AppColor.kScaffoldColor,
            statusBarIconBrightness: Brightness.dark),
      ),
      body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'LOGIN',
            style: AppStyle.kAppBarTextStyle,
          ),
          TextfieldWidget(
              hint: 'Email',
              controller: SigninController.emailController,
              icon: Icons.email),
          TextfieldWidget(
              hint: 'Password',
              controller: SigninController.passwordController,
              icon: Icons.password),
          ElevatedButton(
              onPressed: () {
             
                SigninController().onSubmit();
           
              },
              child: const Text('Login'))
        ],
      ),
    );
  }
}
