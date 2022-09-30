import 'package:flutter/material.dart';
import 'package:travel_aliga/app/utils/ui_helper/home_card_shimmer.dart';

class ExploreMoreCard extends StatelessWidget {
  const ExploreMoreCard({
    Key? key,
    required this.img,
  }) : super(key: key);

  final String img;

  @override
  Widget build(BuildContext context) {
    return
        //  Padding(
        //   padding: const EdgeInsets.symmetric(
        //       horizontal: 7.0, vertical: 8),
        //   child: Container(
        //     height: 50,
        //     width: 60,
        //     decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(5),
        //       image: DecorationImage(
        //           image: NetworkImage(img), fit: BoxFit.fitHeight),
        //     ),
        //   ),
        // );
        Padding(
      padding: const EdgeInsets.symmetric(horizontal: 7.0, vertical: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Image.network(
          img,
          height: 50,
          width: 60,
          fit: BoxFit.fitHeight,
          loadingBuilder: (BuildContext context, Widget child,
              ImageChunkEvent? loadingProgress) {
            if (loadingProgress == null) return child;
            return CustomWidget(
              hight: 50,
              width: 60,
              shapeBorder: ShapeDecoration(
                color: Colors.grey[400]!,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
              ),
            );
          },
        ),
      ),
    );
  }
}
