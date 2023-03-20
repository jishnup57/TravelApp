import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:travel_aliga/app/modules/Settings/model/adress_model.dart';
import 'package:travel_aliga/app/modules/home/model/all_pakage_model.dart';
import 'package:travel_aliga/app/modules/item/model/slot_model.dart';
import 'package:travel_aliga/app/modules/item/service/item_service.dart';
import 'package:travel_aliga/app/utils/error_dialog.dart';

import '../../Favorate/controllers/favorate_controller.dart';

class ItemController extends GetxController {
  ItemController({required this.item});
  @override
  void onInit() async {
    super.onInit();
    checkIsFav();
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
   RxBool isFav = false.obs;
  
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
  }

  addToFavorates()async{
    log('addToFavorates start');
    final response = await ItemApi().addFav(item.packageId.toString());
      if (response != null) {
      if (response.packageId != null) {
         Get.snackbar("Success", "Item isAdded to Favourite",backgroundColor: Colors.black,colorText: Colors.white);
         final favCtrl = Get.find<FavorateController>();
       await favCtrl.fatchFavorates();
       await checkIsFav();
      } else {
        ErrorDialoge.showSnakBar(response.message!);
      }
    } else {
      ErrorDialoge.noNetworkAlert(Get.context!);
    }
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

  checkIsFav(){
    final favCtrl = Get.find<FavorateController>();
    for (var element in favCtrl.favList) {
      if(element.packageId == item.packageId ){
        isFav.value = true;
        log("isFav");
        return;
      }
    }

  }
}
