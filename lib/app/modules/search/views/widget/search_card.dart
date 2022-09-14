import 'package:flutter/material.dart';
import 'package:travel_aliga/app/modules/widgets/image_show.dart';
import 'package:travel_aliga/app/utils/colors.dart';
import 'package:travel_aliga/app/utils/style.dart';


class CardSearch extends StatelessWidget {
  const CardSearch({
    Key? key,
  }) : super(key: key);

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
            margin:const EdgeInsets.all(10) ,
            height: 140,
            decoration: CommonWidget.imageShow(url: 'asset/image/mosque.jpg'),
          ),
          Text('Mosque',style: AppStyle.kCardTextStyle.copyWith(color: AppColor.kBlackColor,fontSize: 16),),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              const Icon(Icons.location_on,size: 13,color: AppColor.kSecondaryColor,),
              Text('India,Delhi',style: AppStyle.kCardTextStyle.copyWith(color: AppColor.kSecondaryColor,fontSize: 13),),
            ],
          )
        ],
      ),
    );
  }

 
}

