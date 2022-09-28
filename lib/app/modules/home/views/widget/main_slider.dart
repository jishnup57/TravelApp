import 'package:flutter/material.dart';
import 'package:travel_aliga/app/modules/home/model/all_pakage_model.dart';
import 'package:travel_aliga/app/modules/home/views/widget/main_card.dart';
import 'package:travel_aliga/app/utils/style.dart';
import 'package:travel_aliga/app/utils/ui_helper/home_card_shimmer.dart';

class MainSlider extends StatelessWidget {
  const MainSlider({
    Key? key,
    required this.packagesList,
    required this.title,
  }) : super(key: key);
  final List<Result> packagesList;
  final String title;
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        AppStyle.kHight8,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: AppStyle.kIntermediateText.copyWith(color: Colors.black54),
            ),
            const Text(
              'See all',
              style: AppStyle.kIntermediateText,
            ),
          ],
        ),
        AppStyle.kHight10,
        LimitedBox(
          maxHeight: height * 0.27,
          child: packagesList.isNotEmpty
              ? ListView.builder(
                  itemBuilder: (context, index) {
                    final item = packagesList[index];
                    return MainCard(
                      item: item,
                    );
                  },
                  scrollDirection: Axis.horizontal,
                  itemCount: packagesList.length,
                )
              : ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomWidget(
                        hight: height * 0.27,
                        width: width * .42,
                        shapeBorder: ShapeDecoration(
                          color: Colors.grey[400]!,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ),
                      )),
                ),
        ),
      ],
    );
  }
}
