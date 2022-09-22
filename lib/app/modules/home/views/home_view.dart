
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:travel_aliga/app/modules/home/views/widget/explore_card.dart';
import 'package:travel_aliga/app/modules/home/views/widget/tab_content_home.dart';
import 'package:travel_aliga/app/modules/home/views/widget/tabbs.dart';
import 'package:travel_aliga/app/modules/home/views/widget/trending_widget.dart';
import 'package:travel_aliga/app/modules/widgets/appbar.dart';
import 'package:travel_aliga/app/utils/colors.dart';
import 'package:travel_aliga/app/utils/style.dart';
import 'package:travel_aliga/app/utils/ui_helper/home_card_shimmer.dart';
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
                return controllerHome.allCategoryList.isNotEmpty? ListView.builder(
                  itemBuilder: (context, index) {
                final list = controllerHome.allCategoryList[index];
               

                    return ExploreMoreCard(img: "${Url.baseUrl}${list.image}");
                  },
                  itemCount: HomeController.instance.allCategoryList.length,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                ):ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  itemBuilder: (context, index) => 
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomWidget(
                          hight: 50,
                          width:60,
                          shapeBorder: ShapeDecoration(
                            color: Colors.grey[400]!,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                          ),
                        ),
                )
                ,);
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
