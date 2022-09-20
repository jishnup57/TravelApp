import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import 'package:get/get.dart';
import 'package:travel_aliga/app/utils/colors.dart';
import 'package:travel_aliga/app/utils/style.dart';

import '../controllers/otp_controller.dart';

class OtpView extends GetView<OtpController> {
  @override
  Widget build(BuildContext context) {
    log('ui build');
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Verification code',
            style: AppStyle.kWelcomeSmall.copyWith(
              fontSize: 22,
              color: AppColor.kBlackColor,
            ),
          ),
          Text(
            'We have send the verification code to',
            style: AppStyle.kLoginIntermedText.copyWith(color: Colors.grey),
          ),
          Text(Get.arguments.toString(),
                    style: AppStyle.kLoginIntermedText,
                  ),
          OtpTextField(
            numberOfFields: 6,
            borderColor: AppColor.kPrimaryColor,
            showFieldAsBox: false,
            onCodeChanged: (String code) {},
            onSubmit: (String verificationCode) {
              controller.otpSubmit(verificationCode);
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content:   SizedBox(
                          width: 50,
                          height: 50,
                          child: Center(
                              child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.red,
                          )),
                        ),
                      insetPadding: EdgeInsets.symmetric(horizontal: 160),
                      contentPadding: EdgeInsets.zero,
                      clipBehavior: Clip.antiAliasWithSaveLayer, 
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                    
                      
                     
                    );
                  });
            },
          ),
        ],
      ),
    );
  }
}
