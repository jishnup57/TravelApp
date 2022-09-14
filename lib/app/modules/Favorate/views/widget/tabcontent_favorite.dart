import 'package:flutter/material.dart';
import 'package:travel_aliga/app/modules/Favorate/views/widget/favorite_slider.dart';


class TabContentFavorite extends StatelessWidget {
  const TabContentFavorite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: TabBarView(
        physics: BouncingScrollPhysics(),
        children: [
          FavoriteSlider(),
          FavoriteSlider(),
          FavoriteSlider(),
        ],
      ),
    );
  }
}
