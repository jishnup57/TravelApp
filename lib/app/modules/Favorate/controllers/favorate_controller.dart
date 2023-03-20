import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:travel_aliga/app/modules/Favorate/model/fav_model.dart';
import 'package:travel_aliga/app/modules/home/controllers/home_controller.dart';
import 'package:travel_aliga/app/modules/home/model/all_pakage_model.dart';
import 'package:travel_aliga/app/utils/api_helper/dio_intercepter.dart';
import 'package:travel_aliga/app/utils/error_dialog.dart';
import 'package:travel_aliga/app/utils/urls.dart';

class FavorateController extends GetxController {
  @override
  void onInit() async {
    await fatchFavorates();
    super.onInit();
  }

  List<FavModel> allFavorateList = [];
  List<Result> favList = [];
  fatchFavorates() async {
    final response = await FavoriteService().service();
    if (response != null) {
      if (response.favorateList != null) {
        allFavorateList.clear();
        for (var element in response.favorateList!) {
          allFavorateList.add(element);
        }
        pickListFromFav();
      } else {
        ErrorDialoge.showSnakBar(response.message!);
      }
    } else {
      ErrorDialoge.noNetworkAlert(Get.context!);
    }
  }

  pickListFromFav() {
    final homectrl = Get.find<HomeController>();
    final idList = allFavorateList.map((e) => e.packageId).toList().toSet().toList();
    favList.clear();
    for (var element in homectrl.allPakagesList) {
      if (idList.contains(element.packageId)) {
        favList.add(element);
      }
    }
    update();
  }
}

class FavoriteService {
  Future<AllFavorate?> service() async {
    Dio dio = await HelperIntercepter().getApiClient();
    try {
      final connectivity = await InternetAddress.lookup('example.com');
      if (connectivity.isNotEmpty && connectivity[0].rawAddress.isNotEmpty) {
        final response = await dio.get(Url.getFavorite);
        if (response.statusCode! >= 200 && response.statusCode! <= 299) {
          return AllFavorate.fromJson(response.data);
        }
        return AllFavorate(message: 'Something wrong');
      }
    } on SocketException catch (_) {
      return null;
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        return AllFavorate(message: 'Service Error');
      } else if (e.type == DioErrorType.connectTimeout) {
        return AllFavorate(message: "Check your connection");
      } else if (e.type == DioErrorType.receiveTimeout) {
        return AllFavorate(message: "Unable to connect to server");
      } else if (e.type == DioErrorType.other) {
        return AllFavorate(message: 'Something Went Wrong');
      }

      return AllFavorate(message: e.message.toString());
    } catch (e) {
      log(e.toString());
      return AllFavorate(message: e.toString());
    }
    return null;
  }
}
