import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:travel_aliga/app/modules/search/model/searchmodel.dart';
import 'package:travel_aliga/app/utils/api_helper/internet_cheker.dart';
import 'package:travel_aliga/app/utils/urls.dart';

class SearchApi {

  Future<SearchResult?> callSearch(String query)async{
    bool connectivity = await HelperInternetChecker.checkConnectivity();

    if(!connectivity){
      print('********no internet*****');
      return null;
    }

    try {
      log('Searching--->$query');
      final response = await Dio().get(Url.search,queryParameters:{
        "search": query,
      } );
      log(response.data.toString());
      if(response.statusCode == 200){
        return SearchResult(
          allSearchResult:  List<AllList>.from((response.data as List).map((x) => AllList.fromJson(x)))
        );
      }else{
        log('else of 200');
        return SearchResult(message: 'Something wrong');
      }
    } on DioError catch(e){
      log('dio error');
       return SearchResult(message: e.message.toString());
    }
    catch (e) {
      log('catch error');
      log(e.toString());
      return SearchResult(message: e.toString());
    }
  }

}