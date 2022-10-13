import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:travel_aliga/app/modules/map_search/view/map_search_view.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Application",
      debugShowCheckedModeBanner: false,
      // initialRoute: AppPages.initial,
      // getPages: AppPages.routes,
      home: MapSearchView(),
    ),
  );
}
