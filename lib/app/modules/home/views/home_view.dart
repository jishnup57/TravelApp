
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:travel_aliga/app/modules/home/views/widget/explore_card.dart';
import 'package:travel_aliga/app/modules/home/views/widget/tab_content_home.dart';
import 'package:travel_aliga/app/modules/home/views/widget/tabbs.dart';
import 'package:travel_aliga/app/modules/home/views/widget/trending_widget.dart';
import 'package:travel_aliga/app/modules/widgets/appbar.dart';
import 'package:travel_aliga/app/utils/colors.dart';
import 'package:travel_aliga/app/utils/style.dart';
import 'package:travel_aliga/app/utils/urls.dart';

import '../controllers/home_controller.dart';

class HomeView extends StatelessWidget {

 final HomeController controllerHome = Get.put(HomeController.instance);

  @override
 Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: [
            const MainAppBar(title: 'Explore',),
            LimitedBox(
              maxHeight: height * .4,
              child:  Tabbs(tabWidget: TabContentHome()),
            ),
             const TrendingWidget(title: 'Popular'),
              AppStyle.kHight8,
            Text(
              "Explore more",
              style: AppStyle.kIntermediateText.copyWith(color: Colors.black),
            ),
            AppStyle.kHight8,
            Container(
              height: height * .1,
              decoration: BoxDecoration(
                  color: AppColor.kWhiteColor, borderRadius: BorderRadius.circular(6)),
              child: GetBuilder<HomeController>(builder: (controllerHome) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                final list = controllerHome.allCategoryList[index];
               

                    return ExploreMoreCard(img: "${Url.baseUrl}${list.image}");
                  },
                  itemCount: HomeController.instance.allCategoryList.length,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                );
              },
              ),
            ),
            AppStyle.kHight8,
            const TrendingWidget(title: 'Trending'),
          ],
        ),
      );
    
  }
}
