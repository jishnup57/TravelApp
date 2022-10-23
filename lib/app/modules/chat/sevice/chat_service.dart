
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:travel_aliga/app/modules/home/model/all_pakage_model.dart';
import 'package:travel_aliga/app/utils/api_helper/dio_intercepter.dart';
import 'package:travel_aliga/app/utils/urls.dart';

class ChatApi {
  Future<Review?> addReview(Review obj) async {

    Dio dio = await HelperIntercepter().getApiClient();
    try {
        final connectivity = await InternetAddress.lookup('example.com');
      if (connectivity.isNotEmpty && connectivity[0].rawAddress.isNotEmpty) {
      final response = await dio.post(Url.baseUrl+Url.review,data:obj.toJson());
      log( response.data.toString());
      if (response.statusCode! >= 200 && response.statusCode! <= 299 ) {
        log(response.data.toString());
        return Review.fromJson(response.data);
      } else {
        log(response.data.toString());
        return null;
      }
      }
    } on DioError catch (_) {
      return null;
    } catch (e) {
      log(e.toString());
      return null;
    }
    return null;
  }
}

