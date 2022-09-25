
import 'package:get/get.dart';
import 'package:travel_aliga/app/modules/search/service/search_service.dart';
import 'package:travel_aliga/app/utils/debounser/debounce.dart';
import 'package:travel_aliga/app/utils/error_dialog.dart';

class SearchController extends GetxController {

    final _debounser = Debouncer(milliseconds: 1 * 1000);
    RxBool isLoading = false.obs;
    RxList searchResultList = [].obs;
    static RxBool topSearch = true.obs;
    onSearchAction(String query){
        _debounser.run(() async {
          topSearch.value = false;
          isLoading.value = true;
           final response = await SearchApi().callSearch(query);
           isLoading.value = false;
           if(response != null){
              if(response.allSearchResult != null){
                 searchResultList.clear();
                  searchResultList.addAll(response.allSearchResult!);
                  update();
              }else{
                ErrorDialoge.showSnakBar(response.message!);
              }
            
           }else{
            ErrorDialoge.noNetworkAlert(Get.context!);
           }
         });
       
        
    }
}
