
import 'package:flutter/material.dart';

class ExploreMoreCard extends StatelessWidget {
  const ExploreMoreCard({
    Key? key,
    required this.img,
  }) : super(key: key);

  final String img;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 7.0, vertical: 8),
      child: Container(
        height: 50,
        width: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          image: DecorationImage(
              image: NetworkImage(img), fit: BoxFit.fitHeight),
        ),
      ),
    );
  }
}
