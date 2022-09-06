
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_aliga/app/utils/style.dart';
class ErrorDialoge{

static errorDialog(BuildContext context, String error ,{String statusCode='Invalied'}) {
  if (!Platform.isIOS) {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(statusCode),
          content: Text(error),
          actions: [
            CupertinoDialogAction(
              child: Text('OK'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        );
      },
    );
  } else {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(statusCode),
          content: Text(error),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
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


}