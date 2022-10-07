import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:travel_aliga/app/modules/signup/controllers/signup_controller.dart';
import 'package:travel_aliga/app/modules/signup/views/widget/signupform.dart';
import 'package:travel_aliga/app/modules/widgets/main_app_bar.dart';
import 'package:travel_aliga/app/utils/colors.dart';
import 'package:travel_aliga/app/utils/style.dart';

class SignupView extends StatelessWidget {
  final controller = Get.put(SignupController());
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColor.kWhiteColor,
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 0),
        child: SystemAppBar(
          appBarColor: AppColor.kWhiteColor,
        ),
      ),
      body: ListView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        physics: BouncingScrollPhysics(),
        children: [
          Stack(
            children: [
              Image.asset(
                'asset/image/signin.jpg',
              ),
              IconButton(
                  onPressed: () => Get.back(),
                  icon: Icon(Icons.arrow_back_ios_new)),
            ],
          ),
          AppStyle.kHight10,
          Form(
            key: controller.signUpKey,
            child: Column(
              children: [
                SignUpTextforms(
                    icon: Icons.person_outline_outlined,
                    text: "First Name",
                    vertical: 20,
                    controller: controller.firstNameControlleer,
                    validator: controller.firstNameValidator),
                SignUpTextforms(
                  icon: Icons.person_outline_outlined,
                  text: "Last Name",
                  vertical: 20,
                  controller: controller.lastNameControlleer,
                  validator: controller.lastNameValidator,
                ),
                SignUpTextforms(
                  icon: Icons.alternate_email,
                  text: "Email",
                  vertical: 15,
                  controller: controller.emailControlleer,
                  validator: controller.emailValidator,
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
                  validator: controller.passwordValidator,
                ),
                SignUpTextforms(
                  icon: Icons.lock_reset_outlined,
                  text: "Confirm Password",
                  vertical: 15,
                  controller: controller.confirmPasswordControlleer,
                  obscureText: true,
                  validator: controller.confirmPasswordValidator,
                ),
                SizedBox(
                  height: 100,
                )
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: Visibility(
        visible: MediaQuery.of(context).viewInsets.bottom == 0,
        child: Obx(
          () => ElevatedButton(
            onPressed: () {
              controller.onSignupButton();
            },
            child: controller.isLoading.isFalse
                ? Text(
                    'Sign Up',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        fontFamily: GoogleFonts.ubuntu().fontFamily),
                  )
                : CupertinoActivityIndicator(
                    color: AppColor.kWhiteColor,
                    radius: 15,
                  ),
            style: ElevatedButton.styleFrom(
                minimumSize: Size(width - 20, 50),
                primary: Color(0xff0088d1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                )),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
