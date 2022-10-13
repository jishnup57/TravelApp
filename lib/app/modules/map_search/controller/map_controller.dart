import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:travel_aliga/app/modules/map_search/model/ontap_model.dart';
import 'package:travel_aliga/app/modules/search/controllers/search_controller.dart';
import 'package:travel_aliga/app/utils/error_dialog.dart';

class MapController extends GetxController {
  RxBool searchVisible = false.obs;
  changeVisibilitySearch() {
    searchVisible.value = !searchVisible.value;
  }

  getPlaceDetails(LatLng tapped) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
          tapped.latitude.toDouble(), tapped.longitude.toDouble());
      var item = placemarks[0];
      print(item.toJson());
    final model =  OnTapModel.fromJson(item.toJson());
    SearchController().onSearchAction("${model.subAdministrativeArea}");
    }on PlatformException catch (e){
      ErrorDialoge.showSnakBar(e.message!.toString());
    }
     catch (_) {
      ErrorDialoge.showSnakBar('Can not get location');
    }
  }
}
