import 'package:flutter/material.dart';
import 'package:travel_aliga/app/modules/home/views/widget/main_slider.dart';

class TabContentHome extends StatelessWidget {
  const TabContentHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            MainSlider(title: '23 Sights',imgUrl: 'asset/image/beach.jpg',imgtitle: 'Maldives',),
            MainSlider(title: '12 Tour',imgUrl: 'asset/image/lake.jpg',imgtitle: 'Lake View'),
            MainSlider(title: '18 Adventure',imgUrl: 'asset/image/light house.jpg',imgtitle: 'Light House'),
          ]),
    );
  }
}