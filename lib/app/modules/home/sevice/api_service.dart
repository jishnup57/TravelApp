import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:travel_aliga/app/modules/home/model/all_category_model.dart';
import 'package:travel_aliga/app/modules/home/model/all_pakage_model.dart';
import 'package:travel_aliga/app/utils/api_helper/dio_instance.dart';
import 'package:travel_aliga/app/utils/api_helper/internet_cheker.dart';
import 'package:travel_aliga/app/utils/urls.dart';

class ApiHome {
  Dio dio = InstanceDio.getDio();
  Future<AllPakages?> getAllPakages() async {
    bool connectivity = await HelperInternetChecker.checkConnectivity();
    if (!connectivity) {
      return null;
    }
   
    try {
      final response = await dio.get(Url.allPakages);
      if (response.statusCode == 200) {
        return AllPakages.fromJson(response.data);
      }
      return AllPakages(message: "Unknown Error occured");
    } on DioError catch (e) {
      log('dio error');
      log(e.response!.data.toString());
      return AllPakages(message:e.response!.data.toString());
    } catch (e) {
      print('catch error');
      print(e.toString());
      return AllPakages(message:e.toString());
    }
  }

  Future<Categories?> getAllCategories()async{
     bool connectivity = await HelperInternetChecker.checkConnectivity();
    if (!connectivity) {
      return null;
    }
    try {
      final response = await dio.get(Url.allCategory);
      if (response.statusCode == 200) {
        return Categories(listAllcategories: List<AllCategory>.from((response.data as List).map((x) => AllCategory.fromJson(x))),
        );
      }else{
        return Categories(message: "Somthing went wrong!");
      }
    } on DioError catch(e){
      log('Dio error');
      return Categories(message: e.toString());
    }
    catch (e) {
      log('Catch error');
      log(e.toString());
      return Categories(message: e.toString());
    }
   
  }
}
