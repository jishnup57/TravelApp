import 'package:dio/dio.dart';
import 'package:travel_aliga/app/utils/urls.dart';

class InstanceDio{

  static Dio getDio(){
    return Dio(BaseOptions(
      baseUrl: Url.baseUrl,
    ));
  }
}