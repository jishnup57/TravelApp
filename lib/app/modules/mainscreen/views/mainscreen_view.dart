
import 'package:flutter/material.dart';
import 'package:iconify_flutter/icons/dashicons.dart';
import 'package:get/get.dart';
import 'package:travel_aliga/app/modules/widgets/main_app_bar.dart';
import 'package:travel_aliga/app/utils/colors.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import '../controllers/mainscreen_controller.dart';

class MainscreenView extends GetView<MainscreenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 0),
        child: SystemAppBar()),
      body: GetBuilder<MainscreenController>(
          init: MainscreenController(),
          builder: (value) {
            return Center(
              child: value.pages.elementAt(value.selectedIndex),
            );
          }),
      bottomNavigationBar: GetBuilder<MainscreenController>(
        init: MainscreenController(),
        builder: (controller) => BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            const BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Iconify(
                Dashicons.search,
                size: 25,
                color: controller.selectedIndex == 1
                    ? AppColor.kPrimaryColor
                    : AppColor.kBlackColor,
              ),
              label: 'Search',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.bookmark),
              label: 'favourites',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
          currentIndex: controller.selectedIndex,
          selectedItemColor: AppColor.kPrimaryColor,
          unselectedItemColor: AppColor.kBlackColor,
          onTap: (value) {
            controller.onItemTapped(value);
          },
        ),
      ),
    );
  }
}
