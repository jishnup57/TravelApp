
import 'package:flutter/material.dart';
import 'package:travel_aliga/app/utils/colors.dart';
import 'package:travel_aliga/app/utils/style.dart';


class TrendingWidget extends StatelessWidget {
  const TrendingWidget({
    Key? key,
   
    required this.title,
  }) : super(key: key);
  final String title;
  

  @override
  Widget build(BuildContext context) {
    final double width=MediaQuery.of(context).size.width;
    final double height=MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style:
              AppStyle.kIntermediateText.copyWith(color: Colors.black),
        ),
        AppStyle.kHight8,
        Container(
          height: height * 0.12,
          decoration: BoxDecoration(
            color: AppColor.kWhiteColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 90,
                width: width*0.2,
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(.5),
                    borderRadius: BorderRadius.circular(8),
                    image: const DecorationImage(
                        image: AssetImage(
                            'asset/image/north-east india.jpg'),
                        fit: BoxFit.cover)),
              ),
              Padding(
                padding: const EdgeInsets.only(left:8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "North-East India",
                      style: AppStyle.kIntermediateText
                          .copyWith(color: Colors.black),
                    ),
                    SizedBox(
                       width: width-(width*0.2)-28,
                      child: Text(
                          "Northeast India is the easternmost region of India representing both a geographic and political administrative division of the country,hghsdfh hisdfgi hg ihoisfdgoihgs igoirhgofdi ihdihfa uirt h sfgi ",
                          style: AppStyle.kWelcomeSmall.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.normal),
                              overflow: TextOverflow.ellipsis,maxLines: 3,),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
