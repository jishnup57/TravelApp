import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:travel_aliga/app/utils/model/new_token_model.dart';

class HelperIntercepter {
  FlutterSecureStorage secureStorage = FlutterSecureStorage();
  Future<Dio> getApiClient() async {
    Dio dio = Dio();
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (options, handler) async {
      final token = await getToken();

      dio.interceptors.clear();
      print('token is');
      log(token);
    
      options.headers.addAll({
        "Authorization": "Bearer $token",
      });
      return handler.next(options);
    }, onResponse: (response, handler) {
      
      return handler.next(response); 
    }, onError: (e, handler) async {
      if (e.response?.statusCode == 403) {
        final refreshToken = await getRefreshToken();
        try {
          await dio.post("http://10.0.2.2:8000/account/refresh/", data: {
            "refresh": refreshToken,
          }).then((value) async {
            if (value.statusCode == 200) {
              final obj = NewToken.fromJSON(value.data);
              //get new tokens ...
              print("new token---->${obj.token}");
              await addToSecureStorage(obj);
              //set bearer
              e.requestOptions.headers.addAll({
                "Authorization": "Bearer ${obj.token}",
              });
              //create request with new access token
              final opts = Options(
                  method: e.requestOptions.method,
                  headers: e.requestOptions.headers);
              final cloneReq = await dio.request(e.requestOptions.path,
                  options: opts,
                  data: e.requestOptions.data,
                  queryParameters: e.requestOptions.queryParameters);

              return handler.resolve(cloneReq);
            }
            return handler.next(e);
          });
        } catch (e) {
          log(e.toString());
        }
      }
    }));
    return dio;
  }

  Future<void> addToSecureStorage(NewToken value) async {
    await secureStorage.write(
      key: "Token",
      value: value.token,
    );
    log('added to secure storage');
  }

  Future<String> getToken() async {
    return await secureStorage.read(key: "Token") ?? "";
  }

    Future<String> getRefreshToken() async {
    FlutterSecureStorage secureStorage = FlutterSecureStorage();
    return await secureStorage.read(key: "refreshToken") ?? "";
  }
}
