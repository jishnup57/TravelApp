import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import 'package:get/get.dart';
import 'package:travel_aliga/app/utils/colors.dart';
import 'package:travel_aliga/app/utils/style.dart';

import '../controllers/otp_controller.dart';

class OtpView extends GetView<OtpController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Verification code',style: AppStyle.kWelcomeSmall.copyWith(fontSize: 22,color: AppColor.kBlackColor,),),
          Text('We have send the verification code to',style: AppStyle.kLoginIntermedText,),
          Text('+919567551757',style: AppStyle.kLoginIntermedText,),
          OtpTextField(
            numberOfFields: 6,
            borderColor: AppColor.kPrimaryColor,
            showFieldAsBox: false,
            onCodeChanged: (String code) {},
            onSubmit: (String verificationCode) {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("Verification Code"),
                      content: Text('Code entered is $verificationCode'),
                    );
                  });
            },
          ),
        ],
      ),
    );
  }
}
