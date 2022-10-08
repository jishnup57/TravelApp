import 'package:flutter/material.dart';
import 'package:travel_aliga/app/modules/Favorate/views/widget/favorite_card.dart';
import 'package:travel_aliga/app/utils/style.dart';

class FavoriteSlider extends StatelessWidget {
  const FavoriteSlider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppStyle.kHight10,
        Expanded(
          child: SizedBox(
            child: ListView.builder(
              itemBuilder: (context, index) => CardFavorite2(),
              itemCount: 20,
            ),
          ),
        ),
      ],
    );
  }
}
