
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
        log('else of 200');
        return Slots(message: 'Something wrong');
      }
    } on DioError catch (e) {
      log('dio error');
      return Slots(message: e.message.toString());
    } catch (e) {
      log('catch error');
      log(e.toString());
      return Slots(message: e.toString());
    }
  }
}
