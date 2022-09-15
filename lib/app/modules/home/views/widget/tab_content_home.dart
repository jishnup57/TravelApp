
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_aliga/app/modules/home/controllers/home_controller.dart';
import 'package:travel_aliga/app/modules/home/views/widget/main_slider.dart';

class TabContentHome extends StatelessWidget {
  TabContentHome({
    Key? key,
  }) : super(key: key);
  final HomeController controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GetBuilder<HomeController>(
        builder: (controller) {
          return TabBarView(physics: NeverScrollableScrollPhysics(), children: [
            MainSlider(
              title: '${controller.allPakagesList.length}  Sights',
              packagesList: controller.allPakagesList,
            ),
            MainSlider(
              title: '${controller.allPakagesList.length} Tour',
              packagesList: controller.allPakagesList,
            ),
            MainSlider(
              title: '${controller.allPakagesList.length} Adventure',
              packagesList: controller.allPakagesList,
            ),
          ]);
        },
      ),
    );
  }
}
