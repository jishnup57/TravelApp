
import 'dart:developer';

import 'package:get/get.dart';
import 'package:travel_aliga/app/modules/search/model/searchmodel.dart';
import 'package:travel_aliga/app/modules/search/service/search_service.dart';
import 'package:travel_aliga/app/utils/debounser/debounce.dart';
import 'package:travel_aliga/app/utils/error_dialog.dart';

class SearchController extends GetxController {

    final _debounser = Debouncer(milliseconds: 1 * 1000);
    RxBool isLoading = false.obs;
    List<AllList> searchResultList = [];
    onSearchAction(String query){
        _debounser.run(() async {
          isLoading.value = true;
           final response = await SearchApi().callSearch(query);
           isLoading.value = false;
           if(response != null){
              if(response.allSearchResult != null){
                  searchResultList.clear();
                  searchResultList.addAll(response.allSearchResult!);
                  update();
                  log(searchResultList.first.packageName.toString());
              }else{
                ErrorDialoge.showSnakBar(response.message!);
              }
            
           }else{
            ErrorDialoge.noNetworkAlert(Get.context!);
           }
         });
       
        
    }
}
