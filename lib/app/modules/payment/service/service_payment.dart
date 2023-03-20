import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:travel_aliga/app/modules/payment/model/payment_initialize.dart';
import 'package:travel_aliga/app/utils/urls.dart';

class PaymentService{
  paymentInitialize(InitializeModel value)async{
    Dio dio = Dio();
    try {
      
    final response = await dio.post(Url.paymentInitilize,data: value.toJson());
    } on DioError catch (e) {
      log(e.response.toString());
    }
    catch (e) {
      log(e.toString());
    }
  }
}