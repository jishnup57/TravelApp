import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_aliga/app/modules/item/controller/item_controller.dart';
import 'package:travel_aliga/app/modules/widgets/main_app_bar.dart';
import 'package:travel_aliga/app/utils/colors.dart';
import 'package:travel_aliga/app/utils/style.dart';
import 'package:travel_aliga/app/utils/ui_helper/home_card_shimmer.dart';
import 'package:travel_aliga/app/utils/ui_helper/rating_star.dart';

class ItemView extends StatelessWidget {
  ItemView({Key? key}) : super(key: key);
  final ItemController controller = Get.put(ItemController());
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 0),
        child: SystemAppBar(
          appBarColor: AppColor.kWhiteColor,
        ),
      ),
      body: Stack(
        children: [
          CachedNetworkImage(
            imageUrl:
                "https://images.unsplash.com/photo-1661585683423-8a955285a6c4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
            fit: BoxFit.fitHeight,
            placeholder: (context, url) => CustomWidget(
              hight: height / 1.8,
              width: double.infinity,
              shapeBorder: ShapeDecoration(
                color: Colors.grey[400],
                shape: RoundedRectangleBorder(),
              ),
            ),
            errorWidget: (context, url, error) => Icon(Icons.error),
            imageBuilder: (context, imageProvider) => Container(
              width: double.infinity,
              height: height / 1.8,
              decoration: BoxDecoration(
                image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                            onTap: () {},
                            child: Icon(
                              Icons.arrow_back_ios_new_rounded,
                              color: AppColor.kWhiteColor,
                            )),
                      ),
                    ],
                  ),
                  Spacer(),
                  Row(
                    children: [
                      AppStyle.kWidth15,
                      Text(
                        "KodaiKKanal",
                        style: AppStyle.kCardTextStyle.copyWith(fontSize: 28),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      AppStyle.kWidth15,
                      RatingStar(starSize: 25, starRating: 4)
                    ],
                  ),
                  SizedBox(
                    height: height * 0.12,
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Stack(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: double.infinity,
                      height: height / 2,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          )),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Column(
                            children: [
                              AppStyle.kHight10,
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    color: AppColor.kPrimaryColor,
                                  ),
                                  Text(
                                    "TamilNadu ,Kerala",
                                    style: AppStyle.kStartButtonText
                                        .copyWith(color: AppColor.kBlackColor),
                                  ),
                                ],
                              ),
                              AppStyle.kHight8,
                              Text(
                                "Short History of Italy's Floating City. The floating city of Venice, one of the most extraordinary cities in the world was built on 118 islands in the middle of the Venetian Lagoon at the head of the Adriatic Sea in Northern Italy gfdskig fjgsdifgh iufgreisg  dgfaiueg",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 4,
                                style: AppStyle.kIntermediateText.copyWith(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xffC8C4C4)),
                              ),
                              AppStyle.kHight8,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Available :",
                                    style: AppStyle.kIntermediateText,
                                  ),
                                  GetBuilder<ItemController>(
                                      builder: (context) {
                                    return DropdownButton(
                                      hint: const Text(
                                        'Select a Date',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      icon: const Icon(
                                        Icons.keyboard_arrow_down,
                                        color: Colors.black,
                                      ),
                                      value: controller.dropdownName,
                                      items: controller.avalableList
                                          .map((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                      onChanged: (value) {
                                        print(value);
                                        controller.dropdownButtonRebuild(value);
                                      },
                                    );
                                  }),
                                  SizedBox(
                                    width: 10,
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Number of People :",
                                    style: AppStyle.kIntermediateText,
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Text(
                                    "5",
                                    style: AppStyle.kIntermediateText
                                        .copyWith(color: AppColor.kBlackColor),
                                  ),
                                ],
                              ),
                              AppStyle.kHight8,
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Things Included:",
                                    style: AppStyle.kIntermediateText,
                                  ),
                                  SizedBox(
                                    width: 25,
                                  ),
                                  Flexible(
                                    child: Text(
                                      "Short History of Italy's Floating City. The floating city of Venice, one of the most extraordinary cities in the world was built on 118 islands in the middle of the Veneti",
                                      style: AppStyle.kIntermediateText
                                          .copyWith(
                                              color: AppColor.kBlackColor),
                                      maxLines: 4,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                              AppStyle.kHight20,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {},
                                    child: Icon(Icons.bookmark),
                                    style: ElevatedButton.styleFrom(
                                        minimumSize: Size(40, 60),
                                        primary: AppColor.kWhiteColor,
                                        onPrimary: AppColor.kPrimaryColor,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        side: BorderSide(
                                            width: 2,
                                            color: AppColor.kPrimaryColor)),
                                  ),
                                 
                                  Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: ElevatedButton.icon(
                                      onPressed: () {},
                                      icon: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(
                                            Icons.arrow_back_ios,
                                            size: 18,
                                          ),
                                          Icon(
                                            Icons.arrow_back_ios,
                                            size: 14,
                                          ),
                                          Icon(
                                            Icons.arrow_back_ios,
                                            size: 12,
                                          )
                                        ],
                                      ),
                                      label: Text('Book Now',textScaleFactor: 1.5,),
                                      style: ElevatedButton.styleFrom(
                                        minimumSize: Size(width * 0.65, 60),
                                        primary: AppColor.kPrimaryColor,
                                        onPrimary: AppColor.kWhiteColor,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  right: width * 0.1,
                  child: CircleAvatar(
                    backgroundColor: AppColor.kPrimaryColor,
                    radius: 30,
                    child: Icon(
                      Icons.play_arrow_rounded,
                      size: 50,
                      color: AppColor.kWhiteColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
