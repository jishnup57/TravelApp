import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:travel_aliga/app/modules/signup/model/signup_model.dart';
import 'package:travel_aliga/app/utils/urls.dart';

class ApiSignUp {
  Dio dio = Dio(
    BaseOptions(baseUrl: Url.baseUrl),
  );
  Future<SignUpModel?> registerUser(SignUpModel obj) async {
    try {
      final connectivity = await InternetAddress.lookup('example.com');
      if (connectivity.isNotEmpty && connectivity[0].rawAddress.isNotEmpty) {
        final response = await dio.post(Url.signup, data: obj.toJson());
        if (response.statusCode! >= 200 && response.statusCode! <= 299) {
          return SignUpModel.fromJson(response.data);
        } else {
          return SignUpModel(message: 'Some unknown error occured');
        }
      }
    } on SocketException catch (_) {
      return null;
    } on DioError catch (e) {
      log('dioerror');
      if (e.response!.data == null) {
        return SignUpModel(message: 'Something went wrong!');
      }
      log(e.response!.data.toString());
      return SignUpModel(message: e.response!.data["detail"]);
    } catch (e) {
      log('catch');
      return SignUpModel(message: e.toString());
    }
    return null;
  }
}
