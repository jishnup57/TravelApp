import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_aliga/app/modules/explore/view/explore_view.dart';
import 'package:travel_aliga/app/modules/home/model/all_pakage_model.dart';
import 'package:travel_aliga/app/modules/item/controller/item_controller.dart';
import 'package:travel_aliga/app/modules/payment/controller/payment_controller.dart';
import 'package:travel_aliga/app/modules/widgets/main_app_bar.dart';
import 'package:travel_aliga/app/utils/colors.dart';
import 'package:travel_aliga/app/utils/style.dart';
import 'package:travel_aliga/app/utils/ui_helper/rating_star.dart';

class ItemView extends StatelessWidget {
  ItemView({Key? key, required this.item}) : super(key: key);
  final Result item;
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
          Container(
              width: double.infinity,
              height: height / 2,
              decoration:BoxDecoration(
                image: DecorationImage(
                  image:  FadeInImage.assetNetwork(placeholder: 'asset/shimmer_effect.json', image:item.imagesMain ).image,
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                        onTap: () => Get.back(),
                        child: Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: AppColor.kWhiteColor,
                        )),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(left:10.0),
                    child: Text(
                      item.packageName,
                      style: AppStyle.kCardTextStyle.copyWith(fontSize: 28),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:8.0),
                    child: RatingStar(starSize: 25, starRating: 4),
                  ),
                  SizedBox(
                    height: height * 0.09,
                  )
                ],
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppStyle.kHight10,
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    color: AppColor.kPrimaryColor,
                                  ),
                                  AppStyle.kWidth,
                                  Text(
                                    item.location,
                                    style: AppStyle.kIntermediateText,
                                  ),
                                ],
                              ),
                              AppStyle.kHight8,
                              Text(
                               " ₹ ${ item.price.toString()}",
                                style: AppStyle.kIntermediateText.copyWith(fontSize: 20,color: Colors.black.withOpacity(0.7)),
                              ),
                              AppStyle.kHight8,
                              Text(
                                item.overview,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 4,
                                style: AppStyle.kIntermediateText.copyWith(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(255, 185, 185, 185)),
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
                                    initState: (state) => controller.getSlotes(item.packageId.toString()),
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
                                    item.noOfPeoples,
                                    style: AppStyle.kIntermediateText.copyWith(
                                        color: AppColor.kBlackColor,
                                        fontWeight: FontWeight.w400),
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
                                      item.inclusion,
                                      style: AppStyle.kIntermediateText
                                          .copyWith(
                                              color: AppColor.kBlackColor,
                                              fontWeight: FontWeight.w400),
                                      maxLines: 4,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                              AppStyle.kHight20,
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  right: width * 0.1,
                  child: GestureDetector(
                    child: CircleAvatar(
                      backgroundColor: AppColor.kPrimaryColor,
                      radius: 30,
                      child: Icon(
                        Icons.play_arrow_rounded,
                        size: 50,
                        color: AppColor.kWhiteColor,
                      ),
                    ),
                    onTap: () => Get.to(()=>ExploreView(item: item,)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {
               //  controller.getSlotes(item.packageId.toString());
              },
              child: Icon(Icons.bookmark_outline_rounded),
              style: ElevatedButton.styleFrom(
                  onPrimary: AppColor.kPrimaryColor, minimumSize: Size(40, 60), primary: AppColor.kWhiteColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  side: BorderSide(width: 2, color: AppColor.kPrimaryColor)),
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: ElevatedButton.icon(
                onPressed: () {
                    PaymentController().option(item.packageName, item.price);
                },
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
                label: Text(
                  'Book Now',
                  textScaleFactor: 1.5,
                ),
                style: ElevatedButton.styleFrom(
                  onPrimary: AppColor.kWhiteColor, minimumSize: Size(width * 0.65, 60), primary: AppColor.kPrimaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
