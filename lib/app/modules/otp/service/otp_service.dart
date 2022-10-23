import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:travel_aliga/app/modules/otp/model/model_otp.dart';
import 'package:travel_aliga/app/modules/otp/model/response_otp.dart';
import 'package:travel_aliga/app/utils/urls.dart';

class OTPApi {
  Dio dio = Dio(BaseOptions(
    baseUrl: Url.baseUrl,
  ));

  Future<OtpResponse?> otpService(OtpModel obj) async {
    try {
      final connectivity = await InternetAddress.lookup('example.com');
      if (connectivity.isNotEmpty && connectivity[0].rawAddress.isNotEmpty) {
        final response = await dio.post(Url.verify, data: obj.toJson());
        if (response.statusCode == 200) {
          log(response.data.toString());
          return OtpResponse.fromJson(response.data);
        } else {
          return OtpResponse(message: response.data['detail']);
        }
      }
    } on SocketException catch (_) {
      return null;
    } on DioError catch (e) {
      if (e.response!.data == null) {
        return OtpResponse(message: 'Somthing wenr wrong!');
      } else {
        return OtpResponse(message: e.response!.data['detail']);
      }
    } catch (e) {
      return OtpResponse(message: e.toString());
    }
    return null;
  }
}
