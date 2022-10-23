
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:travel_aliga/app/utils/colors.dart';
import 'package:travel_aliga/app/utils/style.dart';

class NamedAppBar extends StatelessWidget {
  const NamedAppBar({
    Key? key,
    required this.title
  }) : super(key: key);
 final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: GestureDetector(
        onTap: () => Get.back(),
        child: Icon(
          Icons.arrow_back_ios_new_rounded,
          color: AppColor.kBlackColor,
        ),
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppColor.kScaffoldColor,
          statusBarIconBrightness: Brightness.dark),
      title: Text(
        title.toUpperCase(),
        textScaleFactor: 1.15,
        style: AppStyle.kCardTextStyle.copyWith(
          color: AppColor.kBlackColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: AppColor.kScaffoldColor,
      centerTitle: true,
      elevation: 0,
    );
  }
}
