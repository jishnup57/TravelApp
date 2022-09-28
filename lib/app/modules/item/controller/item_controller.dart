import 'package:get/get.dart';

class ItemController extends GetxController {
  dynamic dropdownName;
  dropdownButtonRebuild(dynamic dropdownName) {
    this.dropdownName = dropdownName;
    update();
  }
  List<String> avalableList = ['jan 25 - jan 10','B','C','E','F'];
}
