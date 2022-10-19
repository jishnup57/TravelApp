
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:travel_aliga/app/modules/chat/view/char_view.dart';
import 'package:travel_aliga/app/modules/explore/controller/explore_controller.dart';
import 'package:travel_aliga/app/modules/home/model/all_pakage_model.dart';
import 'package:travel_aliga/app/utils/colors.dart';
import 'package:travel_aliga/app/utils/style.dart';

class ExploreView extends StatelessWidget {
  ExploreView({Key? key, required this.item}) : super(key: key);
  late final List<String> imgList = [
    item.images1,
    item.imagesMain,
    item.images2,
    item.images3,
  ];
  final Result item;
  final ExploreController controller = Get.put(ExploreController());
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Stack(
      children: [
        CarouselSlider(
          carouselController:controller.carouselController,
          options: CarouselOptions(
            height: height,
            viewportFraction: 1.0,
            enlargeCenterPage: false,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 10),
            onPageChanged: (index, reason) {
              controller.changer(index);
            },
          ),
          items: imgList
              .map(
                (item) =>Image.network(
                  item,
                  fit: BoxFit.cover,
                  width: width,
                  height: height,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                            strokeWidth:2 ,
                      ),
                    );
                  },
                ),
              )
              .toList(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GetBuilder<ExploreController>(builder: (context) {
                return Row(
                  children: List.generate(
                      imgList.length,
                      (index) => Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: CircleAvatar(
                              backgroundColor: index == controller.value
                                  ? AppColor.kWhiteColor
                                  : AppColor.kSecondaryColor,
                              radius: 6,
                            ),
                          )),
                );
              }),
              AppStyle.kHight10,
              Text(
                "Explore ${item.packageName}",
                style: AppStyle.kWelcomeSmall
                    .copyWith(fontSize: 26, color: AppColor.kWhiteColor),
              ),
              AppStyle.kHight10,
              Row(
                children: [
                  Icon(
                    Icons.calendar_month_outlined,
                    color: AppColor.kWhiteColor,
                  ),
                  Text(
                    '${item.days} days',
                    style: AppStyle.kStartButtonText,
                  ),
                  Icon(
                    Icons.location_on,
                    color: AppColor.kWhiteColor,
                    size: 20,
                  ),
                  AppStyle.kWidth,
                  Text(
                    item.location,
                    style: AppStyle.kStartButtonText,
                  )
                ],
              ),
              AppStyle.kHight20,
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: ElevatedButton.icon(
                    onPressed: () {
                     Get.to(()=>ChatView(item: item,));
                    },
                    icon: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.arrow_drop_down_sharp,
                          size: 40,
                        ),
                      ],
                    ),
                    label: Text(
                      'VIEW ALL COMMENTS',
                      textScaleFactor: 1.2,
                    ),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(width * 0.65, 60),
                      primary: Colors.grey.withOpacity(0.4),
                      onPrimary: AppColor.kWhiteColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    ),
  
    );
  }
}


/**
 * CachedNetworkImage(
                  fadeInDuration:Duration(milliseconds: 0) ,
                  fadeOutDuration: Duration(milliseconds: 0),
                  imageUrl: item,
                  imageBuilder: (context, imageProvider) => Container(
                    height: height,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    )),
                  ),
                  placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                    ),
                  ),
                )
 */