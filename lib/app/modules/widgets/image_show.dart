import 'package:flutter/material.dart';

class CommonWidget{
  static  BoxDecoration imageShow({required String url,double radius=10}) {
    return BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            image:  DecorationImage(image: AssetImage(url),fit: BoxFit.cover)
          );
  }
}