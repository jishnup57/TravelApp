import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:travel_aliga/app/modules/Favorate/views/widget/tabcontent_favorite.dart';
import 'package:travel_aliga/app/modules/home/views/widget/tabbs.dart';
import 'package:travel_aliga/app/modules/widgets/appbar.dart';

import '../controllers/favorate_controller.dart';

class FavorateView extends GetView<FavorateController> {
  @override
   Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            const MainAppBar(
              isFilter: true,
              title: 'Favorite',
            ),
            SizedBox(
              height: height * 0.82,
              child: const Tabbs(tabWidget: TabContentFavorite()),
            ),
          ],
        ),
      ),
    );
  }
}
