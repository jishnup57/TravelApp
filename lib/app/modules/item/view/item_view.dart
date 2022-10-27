import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_aliga/app/modules/Settings/views/widget/screen_profile.dart';
import 'package:travel_aliga/app/modules/explore/view/explore_view.dart';
import 'package:travel_aliga/app/modules/home/model/all_pakage_model.dart';
import 'package:travel_aliga/app/modules/item/controller/item_controller.dart';
import 'package:travel_aliga/app/modules/payment/controller/payment_controller.dart';
import 'package:travel_aliga/app/modules/widgets/main_app_bar.dart';
import 'package:travel_aliga/app/utils/colors.dart';
import 'package:travel_aliga/app/utils/error_dialog.dart';
import 'package:travel_aliga/app/utils/style.dart';
import 'package:travel_aliga/app/utils/ui_helper/home_card_shimmer.dart';
import 'package:travel_aliga/app/utils/ui_helper/rating_star.dart';

class ItemView extends StatelessWidget {
  ItemView({required this.item})
      : controller = Get.put(ItemController(item: item));
  final Result item;
  late final ItemController controller;
  final PaymentController paymentController = Get.put(PaymentController());
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
            imageUrl: item.imagesMain,
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
              height: height / 2,
              decoration: BoxDecoration(
                image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
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
                      ),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      item.packageName,
                      style: AppStyle.kCardTextStyle.copyWith(fontSize: 28),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: RatingStar(starSize: 25, starRating: 4),
                  ),
                  SizedBox(
                    height: height * 0.09,
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
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppStyle.kHight20,
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
                              AppStyle.kHight10,
                              Text(
                                " ₹ ${item.price.toString()}",
                                style: AppStyle.kIntermediateText.copyWith(
                                    fontSize: 20,
                                    color: Colors.black.withOpacity(0.7)),
                              ),
                              AppStyle.kHight10,
                              Text(
                                item.overview,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 4,
                                style: AppStyle.kIntermediateText.copyWith(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(255, 185, 185, 185)),
                              ),
                              AppStyle.kHight10,
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
                                    return SizedBox(
                                      width: width / 3,
                                      child: DropdownButtonFormField(
                                        hint: const Text(
                                          'Select a Date',
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        icon: const Icon(
                                          Icons.keyboard_arrow_down,
                                          color: Colors.black,
                                        ),
                                        decoration: InputDecoration(
                                          enabledBorder: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                        ),
                                        items: controller.avalableList
                                            .map((value) {
                                          return DropdownMenuItem<String>(
                                            value: value.id.toString(),
                                            child: Text(value.date.toString()),
                                          );
                                        }).toList(),
                                        onChanged: (value) {
                                          int temp = int.parse(value.toString());
                                          controller.selectedSlot = temp;
                                          log(controller.selectedSlot.toString());
                                        },
                                      ),
                                    );
                                  }),
                                  SizedBox(
                                    width: 10,
                                  )
                                ],
                              ),
                              TileWidget(
                                title: "Number of People",
                                value: item.noOfPeoples,
                              ),
                              AppStyle.kHight10,
                              TileWidget(
                                title: "Things Included",
                                value: item.inclusion,
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
                    onTap: () => Get.to(() => ExploreView(
                          item: item,
                        )),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: Icon(Icons.bookmark_outline_rounded),
              style: ElevatedButton.styleFrom(
                  onPrimary: AppColor.kPrimaryColor,
                  minimumSize: Size(40, 60),
                  primary: AppColor.kWhiteColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  side: BorderSide(width: 2, color: AppColor.kPrimaryColor)),
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: ElevatedButton.icon(
                onPressed: () async {
                  if(controller.selectedSlot == null){
                    ErrorDialoge.showSnakBar('Please Select a Available Date');
                    return;
                  }
                  await controller.getAllAddress();
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) {
                      return controller.addressList.isNotEmpty
                          ? Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  addressTile(
                                      title: 'Permenent address', type: 1),
                                  Visibility(
                                    visible: controller.addressList.length > 1,
                                    child: addressTile(
                                        title: 'Temporary address', type: 0),
                                  )
                                ],
                              ),
                            )
                          : TextButton.icon(
                              onPressed: () {
                                Get.back();
                                Get.to(() => ProfileView());
                              },
                              icon: Icon(Icons.add),
                              label: Text("Add Address"));
                    },
                  );
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
                  onPrimary: AppColor.kWhiteColor,
                  minimumSize: Size(width * 0.65, 60),
                  primary: AppColor.kPrimaryColor,
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

  ListTile addressTile({required String title, required int type}) {
    return ListTile(
      title: Text(
        title,
        style: AppStyle.kIntermediateText.copyWith(color: Colors.black),
      ),
      trailing: IconButton(
          onPressed: () {
            Get.back();
            Get.to(() => ProfileView());
          },
          icon: Icon(Icons.edit)),
      onTap: () {
        switch (type) {
          case 1:
            paymentController.option(item: item,addressID: controller.permanentAddress!.id!,slot: controller.selectedSlot!);
            break;
          default:
            paymentController.option(item:item,addressID: controller.temporaryAddress!.id!,slot: controller.selectedSlot!);
        }
      },
    );
  }
}

class TileWidget extends StatelessWidget {
  const TileWidget({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "$title :",
          style: AppStyle.kIntermediateText,
        ),
        SizedBox(
          width: 30,
        ),
        Flexible(
          child: Text(
            value,
            style: AppStyle.kIntermediateText.copyWith(
                color: AppColor.kBlackColor, fontWeight: FontWeight.w400),
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
