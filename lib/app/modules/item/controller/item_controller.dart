import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:travel_aliga/app/modules/Settings/model/adress_model.dart';
import 'package:travel_aliga/app/modules/home/model/all_pakage_model.dart';
import 'package:travel_aliga/app/modules/item/model/slot_model.dart';
import 'package:travel_aliga/app/modules/item/service/item_service.dart';
import 'package:travel_aliga/app/utils/error_dialog.dart';

class ItemController extends GetxController {
  ItemController({required this.item});
  @override
  void onInit() async {
    super.onInit();
    await getSlotes(item.packageId.toString());
  }

  @override
  void onClose() {
    super.onClose();
    _deleteImageFromCache();
  }

  final Result item;
  List<SlotModel> avalableList = [];
  int? selectedSlot;

  
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

  Future<void> _deleteImageFromCache() async {
    await CachedNetworkImage.evictFromCache(item.imagesMain);
  }

  List<AddressModel> addressList = [];
  AddressModel? permanentAddress;
  AddressModel? temporaryAddress;
  getAllAddress() async {
    Database database = await openDatabase('addressDB.db');
    final value = await database.rawQuery('SELECT * FROM useraddress');
    addressList.clear();
    for (var map in value) {
      final adrs = AddressModel.fromMap(map);
      addressList.add(adrs);
    }
    check();
  }

  check() {
    if (addressList.isNotEmpty) {
      if (addressList.length == 2) {
        if (addressList[0].type == 1) {
          permanentAddress = addressList[0];
          temporaryAddress = addressList[1];
          return;
        } else {
          permanentAddress = addressList[1];
          temporaryAddress = addressList[0];
          return;
        }
      }
      permanentAddress = addressList[0];
      return;
    }
  }
}
