import 'dart:developer';

import 'package:get/get.dart';
import 'package:travel_aliga/app/modules/item/service/item_service.dart';
import 'package:travel_aliga/app/utils/error_dialog.dart';

class ItemController extends GetxController {

  ItemController();



  dynamic dropdownName;
  dropdownButtonRebuild(dynamic dropdownName) {
    this.dropdownName = dropdownName;
    update();
  }
  
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
}
