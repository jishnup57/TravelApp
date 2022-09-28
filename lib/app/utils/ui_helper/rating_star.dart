import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingStar extends StatelessWidget {
  const RatingStar({Key? key, required this.starSize, required this.starRating})
      : super(key: key);
  final double starSize;
  final double starRating;
  @override
  Widget build(BuildContext context) {
    return RatingBar(
      initialRating: starRating,
      ignoreGestures: true,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemSize: starSize,
      ratingWidget: RatingWidget(
          full: const Icon(Icons.star, color: Colors.orange),
          half: const Icon(
            Icons.star_half,
            color: Colors.orange,
          ),
          empty: const Icon(
            Icons.star_outline,
            color: Colors.orange,
          )),
      onRatingUpdate: (value) {},
    );
  }
}
