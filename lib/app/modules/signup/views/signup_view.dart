import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:travel_aliga/app/modules/signup/controllers/signup_controller.dart';
import 'package:travel_aliga/app/modules/signup/views/widget/signupform.dart';
import 'package:travel_aliga/app/utils/colors.dart';

class SignupView extends StatelessWidget {
  final controller = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColor.kWhiteColor,
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: AppColor.kWhiteColor,
            statusBarIconBrightness: Brightness.dark),
      ),
      body: ListView(
        children: [
          Image.asset(
            'asset/image/signup-removebg-preview.png',
          ),
          Form(
            key: controller.signUpKey,
            child: Column(
              children: [
                SignUpTextforms(
                    icon: Icons.person_outline_outlined,
                    text: "First Name",
                    vertical: 20,
                    controller: controller.firstNameControlleer,
                    validator: controller.customValidator),
                SignUpTextforms(
                  icon: Icons.person_outline_outlined,
                  text: "Last Name",
                  vertical: 20,
                  controller: controller.lastNameControlleer,
                  validator: controller.customValidator,
                ),
                SignUpTextforms(
                  icon: Icons.mail_outline_sharp,
                  text: "Email",
                  vertical: 15,
                  controller: controller.emailControlleer,
                  validator: controller.customValidator,
                ),
                SignUpTextforms(
                  icon: Icons.send_to_mobile_rounded,
                  text: "Phone",
                  vertical: 15,
                  keytype: TextInputType.number,
                  controller: controller.phoneControlleer,
                  validator: controller.phoneValidator,
                ),
                SignUpTextforms(
                  icon: Icons.lock_outline,
                  text: "Password",
                  vertical: 15,
                  controller: controller.passwordControlleer,
                  validator: controller.customValidator,
                ),
                SignUpTextforms(
                  icon: Icons.lock_reset_outlined,
                  text: "Confirm Password",
                  vertical: 15,
                  controller: controller.confirmPasswordControlleer,
                  obscureText: true,
                  validator: controller.passwordValidator,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 200,
          )
        ],
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          controller.onSignupButton();
        },
        child: Text(
          'Sign Up',
          style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              fontFamily: GoogleFonts.ubuntu().fontFamily),
        ),
        style: ElevatedButton.styleFrom(
            minimumSize: Size(width - 20, 50),
            primary: Color(0xff0088d1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            )),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
