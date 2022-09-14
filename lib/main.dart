import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:travel_aliga/app/modules/mainscreen/views/mainscreen_view.dart';


void main() {
  runApp(
    GetMaterialApp(
      title: "Application",
      debugShowCheckedModeBanner: false,
      // initialRoute: AppPages.initial,
      // getPages: AppPages.routes,
       home: MainscreenView(),
    ),
  );
}
