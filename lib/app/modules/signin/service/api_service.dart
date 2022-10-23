import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:travel_aliga/app/modules/signin/model/signin_model.dart';
import 'package:travel_aliga/app/modules/signin/model/token_model.dart';

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
    try {
      final connectivity = await InternetAddress.lookup('example.com');
      if (connectivity.isNotEmpty && connectivity[0].rawAddress.isNotEmpty) {
        final result = await dio.post(Url.login, data: obj.toJson());
        if (result.statusCode! >= 200 && result.statusCode! <= 299) {
          return TokenModel.fromJson(result.data);
        } else {
          return TokenModel(message: "Some unknown error occured");
        }
      }
    } on SocketException catch (_) {
      return null;
    } on DioError catch (e) {
      if (e.response!.data == null) {
        return TokenModel(message: 'Something went wrong!');
      }
      log(e.response!.data.toString());
      return TokenModel(message: e.response!.data["detail"]);
    } catch (e) {
      log('catch');
      return TokenModel(message: e.toString());
    }
    return null;
  }
}
