import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:travel_aliga/app/modules/Settings/controllers/profile_controller.dart';
import 'package:travel_aliga/app/routes/app_pages.dart';

 main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ProfileController.initializeDataBase();
  runApp(
    GetMaterialApp(
      title: "Application",
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
    ),
  );
}
