import 'package:flutter/material.dart';
import 'package:travel_aliga/app/modules/search/model/searchmodel.dart';
import 'package:travel_aliga/app/modules/widgets/image_show.dart';
import 'package:travel_aliga/app/utils/colors.dart';
import 'package:travel_aliga/app/utils/style.dart';

class CardSearch extends StatelessWidget {
  const CardSearch({
    Key? key,
    required this.item,
  }) : super(key: key);
  final AllList item;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      color: AppColor.kWhiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: [
          Container(
              margin: const EdgeInsets.all(10),
              height: 140,
              decoration: CommonImageWidget.imageShow(url: item.imagesMain)),
          Text(
            item.packageName,
            style: AppStyle.kCardTextStyle
                .copyWith(color: AppColor.kBlackColor, fontSize: 16),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.location_on,
                size: 13,
                color: AppColor.kSecondaryColor,
              ),
              Text(
                item.location,
                style: AppStyle.kCardTextStyle
                    .copyWith(color: AppColor.kSecondaryColor, fontSize: 13),
              ),
            ],
          )
        ],
      ),
    );
  }
}
