import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CommonWidget {
  static BoxDecoration imageShow({required String url, double radius = 10}) {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        image: DecorationImage(image: AssetImage(url), fit: BoxFit.cover));
  }
}

class CommonImageWidget {
  static BoxDecoration imageShow({required String url, double radius = 10}) {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        image: DecorationImage(image: NetworkImage(url), fit: BoxFit.cover));
  }
}

class CommonImageWidget2 {
  static BoxDecoration imageShow({required String url, double radius = 10}) {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        image: DecorationImage(
            image: CachedNetworkImageProvider(
              url,
            ),
            fit: BoxFit.cover));
  }
}
