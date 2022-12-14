
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_aliga/app/modules/Favorate/views/favorate_view.dart';
import 'package:travel_aliga/app/modules/Settings/views/settings_view.dart';
import 'package:travel_aliga/app/modules/home/views/home_view.dart';
import 'package:travel_aliga/app/modules/search/controllers/search_controller.dart';
import 'package:travel_aliga/app/modules/search/views/search_view.dart';

class MainscreenController extends GetxController {
  int selectedIndex = 0;

  final List<Widget> pages = <Widget>[
    HomeView(),
    SearchView(),
    FavorateView(),
    SettingsView(),
  ];
  void onItemTapped(int index) {
    selectedIndex = index;
    update();
    if(index !=  1){
      SearchController.topSearch.value = true;
    }
  }
}
