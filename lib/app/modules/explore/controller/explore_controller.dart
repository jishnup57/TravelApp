
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';

class ExploreController extends GetxController{
 
  CarouselController carouselController = CarouselController();
  int value = 0;
  changer(int  value){
    this.value = value;
    update();
  }
  @override
  void onClose() {
    super.onClose();
    carouselController.stopAutoPlay();
  }

}