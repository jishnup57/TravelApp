import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:travel_aliga/app/modules/Favorate/model/fav_model.dart';
import 'package:travel_aliga/app/modules/item/model/slot_model.dart';
import 'package:travel_aliga/app/utils/api_helper/dio_intercepter.dart';
import 'package:travel_aliga/app/utils/urls.dart';

class ItemApi {
  Future<Slots?> fetchSlot(String id) async {
    try {
      final connectivity = await InternetAddress.lookup('example.com');
      if (connectivity.isNotEmpty && connectivity[0].rawAddress.isNotEmpty) {
        final response = await Dio().get(Url.slots.replaceFirst('{id}', id));
        if (response.statusCode == 200) {
          return Slots.fromJson(response.data);
        } else {
          return Slots(message: 'Something wrong');
        }
      }
    } on SocketException catch (_) {
      return null;
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        return Slots(message: 'Service Error');
      } else if (e.type == DioErrorType.connectTimeout) {
        return Slots(message: "Check your connection");
      } else if (e.type == DioErrorType.receiveTimeout) {
        return Slots(message: "Unable to connect to server");
      } else if (e.type == DioErrorType.other) {
        return Slots(message: 'Something Went Wrong');
      }

      return Slots(message: e.message.toString());
    } catch (e) {
      log(e.toString());
      return Slots(message: e.toString());
    }
    return null;
  }

  Future<FavModel?> addFav(String id) async {
    Dio dio = await HelperIntercepter().getApiClient() ;
   try {
     final connectivity = await InternetAddress.lookup('example.com');
     if(connectivity.isNotEmpty && connectivity[0].rawAddress.isNotEmpty){
      final response = await dio.post(Url.addedToFav.replaceFirst('{id}', id));
      log(response.data.toString());
      if(response.statusCode! >=200 && response.statusCode! <= 299){
        return FavModel.fromJson(response.data);
      }
     }
   } on SocketException catch (_) {
     return null;
    } on DioError catch (e){
           if (e.response?.statusCode == 401) {
        return FavModel(message: 'Service Error');
      } else if (e.type == DioErrorType.connectTimeout) {
        return FavModel(message: "Check your connection");
      } else if (e.type == DioErrorType.receiveTimeout) {
        return FavModel(message: "Unable to connect to server");
      } else if (e.type == DioErrorType.other) {
        return FavModel(message: 'Something Went Wrong');
      }
    }
    catch (e) {
      log(e.toString());
      return FavModel(message: e.toString());
   }
   return null;
  }


}
