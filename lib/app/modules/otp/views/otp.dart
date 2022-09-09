import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:travel_aliga/app/utils/colors.dart';
import 'package:travel_aliga/app/utils/style.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {}, icon: Icon(Icons.arrow_back_ios_new_rounded)),
      ),
      body: Form(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
          // GetBuilder<OtpController>(
          //   builder: (controller) => Text(
          //     controller.phoneNum.toString(),
          //     style: AppStyle.kLoginIntermedText,
          //   ),
          // ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OtpField(),
              OtpField(),
              OtpField(),
              OtpField(),
              OtpField(),
              OtpField(),
            ],
          )
        ],
      )),
    );
  }
}

class OtpField extends StatelessWidget {
  const OtpField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 58,
      width: 54,
      child: TextField(
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
      ),
    );
  }
}
