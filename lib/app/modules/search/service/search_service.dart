import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:travel_aliga/app/modules/home/model/all_pakage_model.dart';
import 'package:travel_aliga/app/modules/search/model/searchmodel.dart';
import 'package:travel_aliga/app/utils/api_helper/internet_cheker.dart';
import 'package:travel_aliga/app/utils/urls.dart';

class SearchApi {

  Future<SearchResult?> callSearch(String query)async{
    bool connectivity = await HelperInternetChecker.checkConnectivity();

    if(!connectivity){
      return null;
    }

    try {
      log('Searching--->$query');
      final response = await Dio().get("${Url.baseUrl}${Url.search}",queryParameters:{
        "search": query,
      } );
      log(response.data.toString());
      if(response.statusCode == 200){
        return SearchResult(
          allSearchResult:  List<Result>.from((response.data as List).map((x) => Result.fromJson(x)))
        );
      }else{
        return SearchResult(message: 'Something wrong');
      }
    } on DioError catch(e){
       return SearchResult(message: e.message.toString());
    }
    catch (e) {
      log('catch error');
      log(e.toString());
      return SearchResult(message: e.toString());
    }
  }

}