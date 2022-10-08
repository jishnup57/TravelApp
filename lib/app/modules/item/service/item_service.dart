
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:travel_aliga/app/modules/item/model/slot_model.dart';
import 'package:travel_aliga/app/utils/api_helper/internet_cheker.dart';
import 'package:travel_aliga/app/utils/urls.dart';

class ItemApi {
  Future<Slots?> fetchSlot(String id) async {
    bool connectivity = await HelperInternetChecker.checkConnectivity();
    if (!connectivity) {
      return null;
    }

    try {
      final response = await Dio().get(Url.slots.replaceFirst('{id}', id));
      if (response.statusCode == 200) {
        log(response.data.toString());
        return Slots.fromJson(response.data);
      } else {
       
        return Slots(message: 'Something wrong');
      }
    } on DioError catch (e) {
      if(e.response?.statusCode == 401){
        return Slots(message: 'Service Error');
      }else if(e.type == DioErrorType.connectTimeout){
        return Slots(message: "Check your connection");
      }else if(e.type == DioErrorType.receiveTimeout){
        return Slots(message: "Unable to connect to server");
      }else if(e.type == DioErrorType.other){
        return Slots(message: 'Something Went Wrong');
      }
      
      return Slots(message: e.message.toString());
    } catch (e) {
     
      log(e.toString());
      return Slots(message: e.toString());
    }
    
  }
}
