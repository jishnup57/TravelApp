import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_aliga/app/modules/signin/views/widget/textfield.dart';
import 'package:travel_aliga/app/modules/signin/views/widget/textfieldtwwo.dart';
import 'package:travel_aliga/app/routes/app_pages.dart';
import 'package:travel_aliga/app/utils/colors.dart';
import 'package:travel_aliga/app/utils/style.dart';
import '../controllers/signin_controller.dart';

class SigninView extends StatelessWidget {
  final SigninController _controller = Get.put(SigninController());
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColor.kWhiteColor,
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: AppColor.kWhiteColor,
            statusBarIconBrightness: Brightness.dark),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            'asset/image/signin.jpg',
          ),
          Form(
            key: _controller.signUpKey,
            child: Column(
              children: [
                TextfieldWidget(
                  hint: 'Email',
                  controller: SigninController.emailController,
                  icon: Icons.alternate_email,
                ),
                GetBuilder<SigninController>(
                  builder: (ctrl) => TextfieldWidget2(
                    hint: 'Password',
                    controller: SigninController.passwordController,
                    icon: Icons.lock,
                    obsecure: ctrl.secure,
                  ),
                ),
              ],
            ),
          ),
          AppStyle.kHight8,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Text('New to Aliga Register')
                GestureDetector(
                  onTap: () => Get.toNamed(Paths.signUp),
                  child: RichText(
                    text: TextSpan(
                        text: 'New to Aliga ',
                        style: AppStyle.kLoginIntermedText
                            .copyWith(fontWeight: FontWeight.normal),
                        children: [
                          TextSpan(
                              text: 'Register?',
                              style: AppStyle.kLoginIntermedText)
                        ]),
                  ),
                ),
                Text('Forgot password?', style: AppStyle.kLoginIntermedText)
              ],
            ),
          ),
          AppStyle.kHight20,
          ElevatedButton(
            onPressed: () {
              _controller.onSubmit();
            },
            child: Text(
              'Login',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  fontFamily: GoogleFonts.ubuntu().fontFamily),
            ),
            style: ElevatedButton.styleFrom(
                minimumSize: Size(width - 30, 50),
                primary: Color(0xff0088d1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                )),
          )
        ],
      ),
    );
  }
}
