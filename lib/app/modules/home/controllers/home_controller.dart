import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:travel_aliga/app/modules/home/model/all_pakage_model.dart';
import 'package:travel_aliga/app/utils/error_dialog.dart';
import 'package:travel_aliga/app/utils/urls.dart';


class HomeController extends GetxController {


  static final HomeController instance = HomeController._internal();

  factory HomeController() {
    return instance;
  }

  HomeController._internal();


  static List<String> newList = [
      'asset/image/hiking.png',
      'asset/image/balloning.png',
      'asset/image/cycling.jpg',
      'asset/image/kayaking.png',
      'asset/image/skating.png',
      'asset/image/snorkling.png',
    ];
  List<Result> allPakagesList = [];

   final dio = Dio(
      BaseOptions(baseUrl:  Url.baseUrl),
    );
 
  fetchAllPakages()async{
    allPakagesList.clear();
    try {
        final response = await dio.get(Url.allPakages,);
        if (response.statusCode! >= 200 && response.statusCode! <= 299) {
         final data = AllPakages.fromJson(response.data);
          allPakagesList.addAll(data.results);
          update();
        } else {
          ErrorDialoge.showSnakBar(response.statusCode.toString());
        }
      } on DioError catch (e) {
        log('dio error');
        // ErrorDialoge.showSnakBar(e.response!.data['detail']);

        log(e.response!.data.toString());
      } catch (e) {
        print('catch error');
        print(e.toString());
      }
  }

}
