import 'package:flutter/material.dart';
import 'package:travel_aliga/app/modules/home/model/all_pakage_model.dart';
import 'package:travel_aliga/app/modules/home/views/widget/main_card.dart';
import 'package:travel_aliga/app/utils/style.dart';

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
              ? ListView(
                scrollDirection:  Axis.horizontal,
                children: List.generate(packagesList.length, (index) {
                  final item = packagesList[index];
                  return MainCard(item: item);
                }),
              )
              : Center(child: CircularProgressIndicator(strokeWidth: 2,)),
        ),
      ],
    );
  }
}
