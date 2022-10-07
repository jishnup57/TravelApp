import 'dart:developer';

import 'package:get/get.dart';
import 'package:travel_aliga/app/modules/home/model/all_pakage_model.dart';
import 'package:travel_aliga/app/modules/item/model/slot_model.dart';
import 'package:travel_aliga/app/modules/item/service/item_service.dart';
import 'package:travel_aliga/app/utils/error_dialog.dart';

class ItemController extends GetxController {
 late final Result item;




  /*
  List<String> avalableList = [];

  getSlotes(String packageId) async {
    final response = await ItemApi().fetchSlot(packageId);
    if (response != null) {
      if (response.listOfSlots != null) {
        avalableList.clear();
        for (var element in response.listOfSlots!) {
         avalableList.add(element.date!);
        }
      
        update();
      } else {
        ErrorDialoge.showSnakBar(response.message!);
      }
    } else {
      ErrorDialoge.noNetworkAlert(Get.context!);
    }
    log(response.toString());
  }
  */
    List<SlotModel> avalableList = [];

  getSlotes(String packageId) async {
    final response = await ItemApi().fetchSlot(packageId);
    if (response != null) {
      if (response.listOfSlots != null) {
        avalableList.clear();
         for (var element in response.listOfSlots!) {
         avalableList.add(element);
        }
        update();
      } else {
        ErrorDialoge.showSnakBar(response.message!);
      }
    } else {
      ErrorDialoge.noNetworkAlert(Get.context!);
    }
    log(response.toString());
  }
}
