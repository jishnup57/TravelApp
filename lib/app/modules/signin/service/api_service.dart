import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:travel_aliga/app/modules/signin/model/signin_model.dart';
import 'package:travel_aliga/app/modules/signin/model/token_model.dart';
import 'package:travel_aliga/app/utils/api_helper/internet_cheker.dart';

import '../../../utils/urls.dart';

class Api {
  final dio = Dio(
    BaseOptions(
      baseUrl: Url.baseUrl,
      connectTimeout: 60 * 1000, 
      receiveTimeout: 60 * 1000,
    ),
  );

  Future<TokenModel?> getUser(SignInModel obj) async {
    bool connectivity = await HelperInternetChecker.checkConnectivity();
    if (!connectivity) {
      return null;
    }
    try {
      final result = await dio.post(Url.login, data: obj.toJson());
      if (result.statusCode! >= 200 && result.statusCode! <= 299) {
        return TokenModel.fromJson(result.data);
      } else {
        return TokenModel(message: "Some unknown error occured");
      }
    } on DioError catch (e) {
      log('Dioerror');
      if(e.response!.data == null){
        return TokenModel(message: 'Something went wrong!');
      }
      log(e.response!.data.toString());
      return TokenModel(message: e.response!.data["detail"]);
    } catch (e) {
      log('catch');
      return TokenModel(message:e.toString());
    }
  }
}
