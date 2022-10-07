
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:travel_aliga/app/modules/home/model/all_pakage_model.dart';
import 'package:travel_aliga/app/utils/api_helper/dio_intercepter.dart';
import 'package:travel_aliga/app/utils/api_helper/internet_cheker.dart';
import 'package:travel_aliga/app/utils/urls.dart';

class ChatApi {
  Future<Review?> addReview(Review obj) async {
    bool connectivity = await HelperInternetChecker.checkConnectivity();
    if (!connectivity) {
      return null;
    }
    Dio dio = await HelperIntercepter().getApiClient();
    try {
      final response = await dio.post(Url.baseUrl+Url.review,data:obj.toJson());
      if (response.statusCode! >= 200 && response.statusCode! <= 299 ) {
        log(response.data.toString());
        return Review.fromJson(response.data);
      } else {
        log('else of 200');
        log(response.data.toString());
        return null;
      }
    } on DioError catch (e) {
      log('dio error $e');
      return null;
    } catch (e) {
      log('catch error');
      log(e.toString());
      return null;
    }
  }
}
