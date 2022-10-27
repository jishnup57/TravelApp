import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_aliga/app/modules/home/model/all_pakage_model.dart';
import 'package:travel_aliga/app/modules/item/view/item_view.dart';
import 'package:travel_aliga/app/utils/style.dart';
import 'package:travel_aliga/app/utils/ui_helper/home_card_shimmer.dart';
import 'package:travel_aliga/app/utils/ui_helper/rating_star.dart';

class MainCard extends StatelessWidget {
  const MainCard({
    Key? key,
    required this.item,
  }) : super(key: key);
  final Result item;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () => Get.to(() => ItemView(
            item: item,
          )),
      child: Padding(
        padding: const EdgeInsets.only(right: 15),
        child: CachedNetworkImage(
          imageUrl: item.imagesMain,
          placeholder: (context, url) => CustomWidget(
            hight: height * 0.27,
            width: width * .42,
            shapeBorder: ShapeDecoration(
              color: Colors.grey[400]!,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
            ),
          ),
          imageBuilder: (context, imageProvider) => Container(
            width: width * .42,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                AppStyle.kHight8,
                const Spacer(),
                Row(
                  children: [
                    AppStyle.kWidth,
                    RatingStar(starSize: 18, starRating: 3),
                  ],
                ),
                Row(
                  children: [
                    AppStyle.kWidth,
                    Expanded(
                      child: Text(
                        item.packageName,
                        style: AppStyle.kCardTextStyle,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
