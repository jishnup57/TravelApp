
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:travel_aliga/app/modules/otp/model/model_otp.dart';
import 'package:travel_aliga/app/modules/otp/service/otp_service.dart';
import 'package:travel_aliga/app/utils/error_dialog.dart';

class OtpController extends GetxController {
  bool isLoading = false;

  final phone = Get.arguments.toString();

  otpSubmit(String verificationCode) async {
    isLoading = true;
    final obj = OtpModel(code: verificationCode, phone: phone);
    final response = await OTPApi().otpService(obj);
    removeLoading();
    if (response != null) {
      if (response.email != null) {
        debugPrint(response.email.toString());
        ErrorDialoge.errorDialog(Get.context!, "OTP verified!.\n Login again",statusCode: 'Successful');
      } else {
        ErrorDialoge.showSnakBar(response.message.toString());
      }
    } else {
      ErrorDialoge.showSnakBar('No network');
    }
  }

  removeLoading() {
    if (isLoading == true) {
      Get.back();
      isLoading = false;
    }
  }
}
