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
          GetBuilder<OtpController>(
              builder: (controller) => Text(
                    controller.phoneNum.toString(),
                    style: AppStyle.kLoginIntermedText,
                  )),
          OtpTextField(
            numberOfFields: 6,
            borderColor: AppColor.kPrimaryColor,
            showFieldAsBox: false,
            onCodeChanged: (String code) {},
            onSubmit: (String verificationCode) {
              controller.otpSubmit(verificationCode);
            },
          ),
          AppStyle.kHight10,
          Obx(() =>  Visibility(
              visible: controller.isLoading.value,
              child: CircularProgressIndicator(strokeWidth: 2, ),
            ),
          )
        ],
      ),
    );
  }
}
