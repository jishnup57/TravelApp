import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:travel_aliga/app/modules/map_search/model/ontap_model.dart';
import 'package:travel_aliga/app/modules/search/service/search_service.dart';
import 'package:travel_aliga/app/utils/error_dialog.dart';

class MapController extends GetxController {
  RxBool searchVisible = false.obs;
  RxList itemList = [].obs;
  changeVisibilitySearch() {
    searchVisible.value = !searchVisible.value;
  }
  late double currentPositionLatitude;
  late double currentPositionLongitude;
  getPlaceDetails(LatLng tapped) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
          tapped.latitude.toDouble(), tapped.longitude.toDouble());
      var item = placemarks[0];
      print(item.toJson());
      final model = OnTapModel.fromJson(item.toJson());
      itemList.clear();
      update();
      await onSearchAction("${model.subAdministrativeArea}");

      log(itemList.toString());
    } on PlatformException catch (e) {
      ErrorDialoge.showSnakBar(e.message!.toString());
    } catch (_) {
      ErrorDialoge.showSnakBar('Can not get location');
    }
    update();
  }

  itemListClear() {
    itemList.clear();
    update();
  }

  onSearchAction(String query) async {
    final response = await SearchApi().callSearch(query);

    if (response != null) {
      if (response.allSearchResult != null) {
        itemList.addAll(response.allSearchResult!);
        update();
      } else {
        ErrorDialoge.showSnakBar(response.message!);
      }
    } else {
      ErrorDialoge.noNetworkAlert(Get.context!);
    }
  }


}
