import 'package:get/get.dart';

import '../controllers/favorate_controller.dart';

class FavorateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FavorateController>(
      () => FavorateController(),
    );
  }
}
