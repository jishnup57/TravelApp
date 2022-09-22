
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:travel_aliga/app/modules/home/model/all_pakage_model.dart';
import 'package:travel_aliga/app/modules/home/sevice/api_service.dart';
import 'package:travel_aliga/app/utils/error_dialog.dart';
import 'package:travel_aliga/app/utils/urls.dart';

import '../model/all_category_model.dart';


class HomeController extends GetxController {


  static final HomeController instance = HomeController._internal();

  factory HomeController() {
    return instance;
  }

  HomeController._internal();

  List<Result> allPakagesList = [];

   final dio = Dio(
      BaseOptions(baseUrl:  Url.baseUrl),
    );
 
    fetchAllPakages()async{
      final response = await ApiHome().getAllPakages();
      if(response != null ){

        if (response.results != null) {
          allPakagesList.clear();
          allPakagesList.addAll(response.results!);
          update();
        }else{
            ErrorDialoge.showSnakBar(response.message.toString());
        }
        
      } else {
        ErrorDialoge.noNetworkAlert(Get.context!);
      }
    }



  List<AllCategory> allCategoryList = [];
  // featchAllCategories()async{

    
  //     allCategoryList.clear();
  //     try {
  //       final response = await dio.get(Url.allCategory);
  //       if(response.statusCode ==  200){
  //           allCategoryList = (response.data as List).map((e) {
  //           return AllCategory.fromJson(e);
  //         }).toList();
  //       }else {
  //         ErrorDialoge.showSnakBar(response.statusCode.toString());
  //       }
  //     }  on DioError catch (e) {
  //       log('dio error');
  //       // ErrorDialoge.showSnakBar(e.response!.data['detail']);

  //       log(e.response!.data.toString());
  //     }catch (e) {
  //         print('catch error');
  //       print(e.toString());
  //     }
  // }
  featchAllCategories()async{
    allCategoryList.clear();
    final response = await ApiHome().getAllCategories();
    if(response != null){
      if(response.listAllcategories != null){
        allCategoryList.addAll(response.listAllcategories!);
      }else{
        ErrorDialoge.showSnakBar(response.message!);
      }
    }else{
      ErrorDialoge.showSnakBar('no network');
    }
  }


}
