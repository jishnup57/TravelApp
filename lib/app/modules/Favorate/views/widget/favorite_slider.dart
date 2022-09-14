
import 'package:flutter/material.dart';
import 'package:travel_aliga/app/modules/Favorate/views/widget/favorite_card.dart';
import 'package:travel_aliga/app/utils/style.dart';

class FavoriteSlider extends StatelessWidget {
  const FavoriteSlider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        AppStyle.kHight10,
        SizedBox(
          width: double.infinity,
          height: height * 0.73,
          child: ListView.builder(
            itemBuilder: (context, index) => const CardFavorite(),
            itemCount: 20,
          ),
        ),
      ],
    );
  }
}
