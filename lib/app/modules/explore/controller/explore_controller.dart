import 'package:get/get.dart';

class ExploreController extends GetxController{
  int value = 0;
  changer(int  value){
    this.value = value;
    update();
  }
}