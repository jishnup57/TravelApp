import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_aliga/app/modules/home/controllers/home_controller.dart';
import 'package:travel_aliga/app/modules/home/model/all_pakage_model.dart';
import 'package:travel_aliga/app/utils/colors.dart';
import 'package:travel_aliga/app/utils/style.dart';
import 'package:travel_aliga/app/utils/ui_helper/home_card_shimmer.dart';

class TrendingWidget extends StatelessWidget {
  TrendingWidget({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;
  late final Result item;
  final HomeController controllerHome = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppStyle.kIntermediateText.copyWith(color: Colors.black),
        ),
        AppStyle.kHight8,
        GetBuilder<HomeController>(builder: (controllerHome) {
          if (controllerHome.allCategoryList.isNotEmpty) {
            if (title == "Popular") {
              item = controllerHome.popular;
            } else {
              item = controllerHome.trending;
            }
            return Container(
              height: height * 0.12,
              decoration: BoxDecoration(
                color: AppColor.kWhiteColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      item.imagesMain,
                      height: 90,
                      width: width * 0.2,
                      fit: BoxFit.cover,
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) return child;
                        return CustomWidget(
                          hight: 90,
                          width: width * 0.2,
                          shapeBorder: ShapeDecoration(
                            color: Colors.grey[400]!,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          item.packageName,
                          style: AppStyle.kIntermediateText
                              .copyWith(color: Colors.black),
                        ),
                        SizedBox(
                          width: width - (width * 0.2) - 28,
                          child: Text(
                            item.overview,
                            style: AppStyle.kWelcomeSmall.copyWith(
                                fontSize: 12, fontWeight: FontWeight.normal),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          }
          return CustomWidget(
            hight: height * 0.12,
            width: double.infinity,
            shapeBorder: ShapeDecoration(
              color: Colors.grey[400]!,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
            ),
          );
        }),
      ],
    );
  }
}
