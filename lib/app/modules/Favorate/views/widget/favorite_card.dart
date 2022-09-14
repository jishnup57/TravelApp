import 'package:flutter/material.dart';
import 'package:travel_aliga/app/utils/colors.dart';
import 'package:travel_aliga/app/utils/style.dart';

class CardFavorite extends StatelessWidget {
  const CardFavorite({Key? key}) : super(key: key);

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
                Container(
                  height: height * 0.18,
                  width: width * 0.29,
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(.5),
                      borderRadius: BorderRadius.circular(8),
                      image: const DecorationImage(
                          image: AssetImage('asset/image/north-east india.jpg'),
                          fit: BoxFit.cover)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "North-East India",
                        style: AppStyle.kIntermediateText
                            .copyWith(color: Colors.black, fontSize: 18),
                      ),
                      const Text(
                        '₹ 2000',
                        style: AppStyle.kIntermediateText,
                      ),
                      SizedBox(
                        width: width - (width * 0.3) - 28,
                        child: Text(
                          "Northeast India is the easternmost region of India representing both a geographic and political administrative division of the country",
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
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundColor: AppColor.kBlackColor.withOpacity(.2),
                child:  Icon(
                  Icons.bookmark,
                  size: 24,
                  color: AppColor.kPrimaryColor.withOpacity(.8),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
