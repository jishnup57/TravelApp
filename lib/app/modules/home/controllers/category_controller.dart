import 'package:get/get.dart';
import 'package:travel_aliga/app/modules/home/model/all_pakage_model.dart';
import 'package:travel_aliga/app/modules/home/sevice/api_service.dart';
import 'package:travel_aliga/app/utils/error_dialog.dart';

class CategoryItemsController extends GetxController{
  CategoryItemsController({required this.slugName});
  final String slugName;
  @override
  void onInit() {
    super.onInit();
     fetchAllPakages();
  }
    bool isLoading = false;
    List<Result> allPakagesList = [];
   fetchAllPakages() async {
    isLoading = true;
    update();
    final response = await ApiHome().getPakagesFromCategory(slugName);
    isLoading = false;
    update();
    if (response != null) {
      if (response.results != null) {
        allPakagesList.clear();
        allPakagesList.addAll(response.results!);
        update();
      } else {
        ErrorDialoge.showSnakBar(response.message.toString());
      }
    } else {
      ErrorDialoge.noNetworkAlert(Get.context!);
    }
  }
}

/**
 *    fetchAllPakages() async {
    final response = await ApiHome().getPakagesFromCategory();
    if (response != null) {
      if (response.pakageList != null) {
        allPakagesList.clear();
        allPakagesList.addAll(response.pakageList!);
        update();
      } else {
        ErrorDialoge.showSnakBar(response.message.toString());
      }
    } else {
      ErrorDialoge.noNetworkAlert(Get.context!);
    }
  }
 */