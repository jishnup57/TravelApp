
import 'package:flutter/material.dart';
import 'package:travel_aliga/app/modules/search/model/searchmodel.dart';
import 'package:travel_aliga/app/utils/colors.dart';
import 'package:travel_aliga/app/utils/style.dart';
import 'package:travel_aliga/app/utils/ui_helper/home_card_shimmer.dart';

class MapCard extends StatelessWidget {
  const MapCard({
    Key? key,
    required this.item,
  }) : super(key: key);
  final AllList item;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(top: 18),
      child: Stack(
        children: [
          Container(
            height: height * 0.2,
            decoration: BoxDecoration(
              color: AppColor.kWhiteColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    item.imagesMain,
                    height: height * 0.18,
                    width: width * 0.29,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) =>
                        loadingProgress == null
                            ? child
                            : CustomWidget(
                                hight: height * 0.18,
                                width: width * 0.29,
                                shapeBorder: ShapeDecoration(
                                  color: Colors.grey[400]!,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                ),
                              ),
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
                            .copyWith(color: Colors.black, fontSize: 18),
                      ),
                       Text(
                        '₹ ${item.price}',
                        style: AppStyle.kIntermediateText,
                      ),
                      SizedBox(
                        width: width - (width * 0.3) - 28,
                        child: Text(
                          item.overview,
                          style: AppStyle.kWelcomeSmall.copyWith(
                              fontSize: 12, fontWeight: FontWeight.normal),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
