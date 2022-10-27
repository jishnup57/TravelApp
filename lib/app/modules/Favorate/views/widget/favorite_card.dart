import 'package:flutter/material.dart';
import 'package:travel_aliga/app/modules/home/model/all_pakage_model.dart';
import 'package:travel_aliga/app/utils/colors.dart';
import 'package:travel_aliga/app/utils/style.dart';
import 'package:travel_aliga/app/utils/ui_helper/home_card_shimmer.dart';

class CardFavorite extends StatelessWidget {
  const CardFavorite({Key? key, required this.item,this.favorateVisible = true}) : super(key: key);
  final Result item;
  final bool favorateVisible;
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
          Visibility(
            visible: favorateVisible,
            child: Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundColor: AppColor.kBlackColor.withOpacity(.4),
                  child: Icon(
                    Icons.bookmark_border_outlined,
                    size: 24,
                    color: AppColor.kWhiteColor.withOpacity(.8),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
