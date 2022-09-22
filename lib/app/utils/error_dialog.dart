

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:travel_aliga/app/routes/app_pages.dart';
import 'package:travel_aliga/app/utils/style.dart';
class ErrorDialoge{

static errorDialog(BuildContext context, String error ,{String statusCode='Invalied'}) {

    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(statusCode),
          content: Text(error),
          actions: [
            CupertinoDialogAction(
              child: Text('OK'),
              onPressed: () => Get.offAllNamed(Paths.signIn),
            ),
          ],
        );
      },
    );
  
}


 static showSnakBar(String message) {
    Get.snackbar(
      "Error",
      '',
      snackPosition: SnackPosition.BOTTOM,
      icon:Icon(Icons.warning_amber_outlined,color: Colors.yellow,) ,
      messageText: Text(message,style: AppStyle.kCardTextStyle.copyWith(fontSize: 14),),
      backgroundColor: Colors.red,
      borderRadius: 10,
      margin: EdgeInsets.all( 10),
      colorText: Colors.white,
    );
  }

  static noNetworkAlert(BuildContext context){
       showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          title: Center(child: Text('No Internet',style: TextStyle(color: Colors.black.withOpacity(0.6)),)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Lottie.asset("asset/no-connection-internet.json"),
            ],
          ),
        );
      },
    );
  }


}