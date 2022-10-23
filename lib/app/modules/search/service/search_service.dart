import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:travel_aliga/app/modules/home/model/all_pakage_model.dart';
import 'package:travel_aliga/app/modules/search/model/searchmodel.dart';
import 'package:travel_aliga/app/utils/urls.dart';

class SearchApi {
  Future<SearchResult?> callSearch(String query) async {
    try {
      final connectivity = await InternetAddress.lookup('example.com');
      if (connectivity.isNotEmpty && connectivity[0].rawAddress.isNotEmpty) {
        log('Searching--->$query');
        final response =
            await Dio().get("${Url.baseUrl}${Url.search}", queryParameters: {
          "search": query,
        });
        log(response.data.toString());
        if (response.statusCode == 200) {
          return SearchResult(
              allSearchResult: List<Result>.from(
                  (response.data as List).map((x) => Result.fromJson(x))));
        } else {
          return SearchResult(message: 'Something wrong');
        }
      }
    } on SocketException catch (_) {
      return null;
    } on DioError catch (e) {
      return SearchResult(message: e.message.toString());
    } catch (e) {
      log('catch error');
      log(e.toString());
      return SearchResult(message: e.toString());
    }
    return null;
  }
}
