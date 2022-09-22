import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_aliga/app/modules/splash/controller/splash_controller.dart';

class SplashView extends StatelessWidget {
   SplashView({Key? key}) : super(key: key);
  final SplashController controller = Get.put(SplashController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text('Splash'),
        ),
      ),
    );
  }
}