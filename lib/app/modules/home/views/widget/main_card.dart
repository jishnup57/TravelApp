import 'package:flutter/material.dart';
import 'package:travel_aliga/app/modules/widgets/image_show.dart';
import 'package:travel_aliga/app/utils/colors.dart';
import 'package:travel_aliga/app/utils/style.dart';
import 'package:travel_aliga/app/utils/ui_helper/rating_star.dart';

class MainCard extends StatelessWidget {
  const MainCard({
    Key? key,
    required this.imgUrl,
    required this.imgtitle,
  }) : super(key: key);
  final String imgUrl;
  final String imgtitle;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Card(
        elevation: 4,
        shadowColor: AppColor.kPrimaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Container(
          width: width * .42,
          decoration: CommonImageWidget2.imageShow(url: imgUrl, radius: 20),
          child: Column(
            children: [
              AppStyle.kHight8,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: CircleAvatar(
                      backgroundColor: AppColor.kBlackColor.withOpacity(.4),
                      child: const Icon(
                        Icons.bookmark_outline,
                        size: 24,
                        color: AppColor.kWhiteColor,
                      ),
                    ),
                  ),
                ],
              ),
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
                      imgtitle,
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
    );
  }
}
