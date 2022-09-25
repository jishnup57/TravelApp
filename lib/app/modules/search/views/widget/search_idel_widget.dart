import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_aliga/app/modules/Favorate/views/widget/favorite_card.dart';
import 'package:travel_aliga/app/modules/search/controllers/search_controller.dart';
import 'package:travel_aliga/app/utils/style.dart';

class SearchIdleWidget extends StatelessWidget {
  SearchIdleWidget({Key? key}) : super(key: key);
  final controller = Get.find<SearchController>();
  @override
  Widget build(BuildContext context) {
    if (controller.isLoading.value) {
      return SliverList(
          delegate: SliverChildListDelegate([
        SizedBox(
          height: 400,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        )
      ]));
    } else if (SearchController.topSearch.value) {
      return SliverList(
          delegate: SliverChildListDelegate([
        AppStyle.kHight10,
        Text(
          'Top Search',
          style: AppStyle.kIntermediateText,
        ),
        ListView.separated(
          itemBuilder: (context, index) {
            return CardFavorite();
          },
          separatorBuilder: (context, index) => AppStyle.kHight8,
          itemCount: 10,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
        ),
      ]));
    } else {
      return SliverList(
          delegate: SliverChildListDelegate([
        SizedBox(
          height: 400,
          child: Center(
            child: Text("No Result Found"),
          ),
        )
      ]));
    }
  }
}

// ListView(
//         shrinkWrap = true,
//         children = [
//           Text(
//             'Top Search',
//             style: AppStyle.kIntermediateText,
//           ),
//           ListView.builder(
//             shrinkWrap: true,
//             physics: NeverScrollableScrollPhysics(),
//             itemBuilder: (context, index) {
//               return CardFavorite();
//             },
//           )
//         ],
//       )