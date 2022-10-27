import 'dart:math';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:travel_aliga/app/modules/home/model/all_pakage_model.dart';
import 'package:travel_aliga/app/modules/home/sevice/api_service.dart';
import 'package:travel_aliga/app/utils/error_dialog.dart';
import 'package:travel_aliga/app/utils/urls.dart';

import '../model/all_category_model.dart';

class HomeController extends GetxController {
  @override
  void onInit() async{
    await fetchAllPakages();
    await featchAllCategories();
    super.onInit();
  }

  static final HomeController instance = HomeController._internal();

  factory HomeController() {
    return instance;
  }

  HomeController._internal();
  final _random = Random();
  late Result popular;
  late Result trending;
  List<Result> allPakagesList = [];

  final dio = Dio(
    BaseOptions(baseUrl: Url.baseUrl),
  );

  fetchAllPakages() async {
    final response = await ApiHome().getAllPakages();
    if (response != null) {
      if (response.results != null) {
        allPakagesList.clear();
        allPakagesList.addAll(response.results!);
        popular = allPakagesList[_random.nextInt(allPakagesList.length)];
        trending = allPakagesList[_random.nextInt(allPakagesList.length)];
        update();
      } else {
        ErrorDialoge.showSnakBar(response.message.toString());
      }
    } else {
      ErrorDialoge.noNetworkAlert(Get.context!);
    }
  }

  List<AllCategory> allCategoryList = [];

  featchAllCategories() async {
    allCategoryList.clear();
    final response = await ApiHome().getAllCategories();
    if (response != null) {
      if (response.listAllcategories != null) {
        allCategoryList.addAll(response.listAllcategories!);
      } else {
        ErrorDialoge.showSnakBar(response.message!);
      }
    } else {
      ErrorDialoge.showSnakBar('no network');
    }
  }
}
