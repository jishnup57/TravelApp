import 'package:get/get.dart';

import '../controllers/mainscreen_controller.dart';

class MainscreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainscreenController>(
      () => MainscreenController(),
    );
  }
}
