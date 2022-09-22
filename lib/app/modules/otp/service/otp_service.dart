import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:travel_aliga/app/modules/otp/model/model_otp.dart';
import 'package:travel_aliga/app/modules/otp/model/response_otp.dart';
import 'package:travel_aliga/app/utils/api_helper/internet_cheker.dart';
import 'package:travel_aliga/app/utils/urls.dart';

class OTPApi{
  Dio dio = Dio(
    BaseOptions(baseUrl: Url.baseUrl,)
  );

  Future<OtpResponse?> otpService(OtpModel obj)async{
    bool connectivity = await HelperInternetChecker.checkConnectivity();
    if(!connectivity){
      return null;
    }
    try {
      final response = await dio.post(Url.verify,data: obj.toJson());
      if(response.statusCode == 200){
        log(response.data.toString());
        return OtpResponse.fromJson(response.data);
      }else{
        return OtpResponse(message: response.data['detail']);
      }
    }on DioError catch(e){
      if(e.response!.data == null){
        return OtpResponse(message: 'Somthing wenr wrong!');
      }
      else{
        return OtpResponse(message: e.response!.data['detail']);
      }
    }
     catch (e) {
      return OtpResponse(message: e.toString());
    }
  }
}