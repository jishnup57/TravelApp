import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomWidget extends StatelessWidget {
  const CustomWidget({
    Key? key,
    required this.hight,
    required this.width,
    required this.shapeBorder,
  }) : super(key: key);
  final double width;
  final double hight;
  final Decoration shapeBorder;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.withOpacity(.3),
      highlightColor: Colors.grey.withOpacity(.1),
      period: Duration(seconds: 2),
      child: Container(
          width: width,
          height: hight,
          decoration:shapeBorder,),
    );
  }
}
