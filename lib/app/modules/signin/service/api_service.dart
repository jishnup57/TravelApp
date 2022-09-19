import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
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
        log(result.data.toString());
        return TokenModel.fromJson(result.data);
      } else {
        return TokenModel.fromJson(result.data);
      }
    } on SocketException catch (e) {
      log('...............Socket exception....................');
      debugPrint(e.toString());
      return null;
    } on DioError catch (e) {
      log('Dioerror');
      log(e.response!.data.toString());
      return TokenModel.fromJson(e.response!.data);
    } catch (_) {
      log('Dioerror');
      return TokenModel(message: 'Catch error');
    }
  }
}
