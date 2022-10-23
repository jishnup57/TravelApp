import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:travel_aliga/app/modules/home/model/all_category_model.dart';
import 'package:travel_aliga/app/modules/home/model/all_pakage_model.dart';
import 'package:travel_aliga/app/utils/api_helper/dio_instance.dart';
import 'package:travel_aliga/app/utils/urls.dart';

class ApiHome {
  Dio dio = InstanceDio.getDio();
  Future<AllPakages?> getAllPakages() async {
    try {
      final connectivity = await InternetAddress.lookup('example.com');
      if (connectivity.isNotEmpty && connectivity[0].rawAddress.isNotEmpty) {
        final response = await dio.get(Url.allPakages);
        if (response.statusCode == 200) {
          return AllPakages.fromJson(response.data);
        }
        return AllPakages(message: "Unknown Error occured");
      }
    } on SocketException catch (_) {
      print('not connected');
      return null;
    } on DioError catch (e) {
      log('dio error');
      log(e.response!.data.toString());
      return AllPakages(message: e.response!.data.toString());
    } catch (e) {
      print('catch error');
      print(e.toString());
      return AllPakages(message: e.toString());
    }
    return null;
  }

  Future<Categories?> getAllCategories() async {
    try {
      final connectivity = await InternetAddress.lookup('example.com');
      if (connectivity.isNotEmpty && connectivity[0].rawAddress.isNotEmpty) {
        final response = await dio.get(Url.allCategory);
        if (response.statusCode == 200) {
          return Categories(
            listAllcategories: List<AllCategory>.from(
                (response.data as List).map((x) => AllCategory.fromJson(x))),
          );
        } else {
          return Categories(message: "Somthing went wrong!");
        }
      }
    } on SocketException catch (_) {
      print('not connected');
      return null;
    } on DioError catch (e) {
      log('Dio error');
      return Categories(message: e.toString());
    } catch (e) {
      log('Catch error');
      log(e.toString());
      return Categories(message: e.toString());
    }
    return null;
  }

  Future<AllPakages?> getPakagesFromCategory(String slugName) async {
    try {
      final connectivity = await InternetAddress.lookup('example.com');
      if (connectivity.isNotEmpty && connectivity[0].rawAddress.isNotEmpty) {
        final response =
            await dio.get("https://goaliga.cartbia.ml/trips/$slugName/");

        if (response.statusCode == 200) {
          return AllPakages.fromCatList(response.data);
        }
        return AllPakages(message: "Unknown Error occured");
      }
    } on SocketException catch (_) {
      print('not connected');
      return null;
    } on DioError catch (e) {
      log('dio error');
      log(e.response!.data.toString());
      return AllPakages(message: e.response!.data.toString());
    } catch (e) {
      print('catch error');
      print(e.toString());
      return AllPakages(message: e.toString());
    }
    return null;
  }
}
