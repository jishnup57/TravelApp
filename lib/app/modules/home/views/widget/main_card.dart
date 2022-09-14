import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:travel_aliga/app/modules/widgets/image_show.dart';
import 'package:travel_aliga/app/utils/colors.dart';
import 'package:travel_aliga/app/utils/style.dart';

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
    double width=MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Card(
        elevation: 4,
        shadowColor: AppColor.kPrimaryColor,
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
        child: Container(
          width: width*.42,
          decoration: CommonWidget.imageShow(url: imgUrl,radius: 20),
          child: Column(
            children: [
             AppStyle.kHight8,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children:  [
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
                  RatingBar(
                      initialRating: 3,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 18,
                      ratingWidget: RatingWidget(
                          full: const Icon(Icons.star, color: Colors.orange),
                          half: const Icon(
                            Icons.star_half,
                            color: Colors.orange,
                          ),
                          empty: const Icon(
                            Icons.star_outline,
                            color: Colors.orange,
                          )),
                      onRatingUpdate: (value) {}),
                ],
              ),
               Row(
                 children: [
                  AppStyle.kWidth,
                   Text(
                    imgtitle,
                    style: AppStyle.kCardTextStyle,
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
