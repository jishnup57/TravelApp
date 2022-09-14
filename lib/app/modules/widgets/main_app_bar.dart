
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:travel_aliga/app/utils/colors.dart';

class SystemAppBar extends StatelessWidget {
   SystemAppBar({
    Key? key,
    this.appBarColor =  AppColor.kScaffoldColor,
  }) : super(key: key);
  final Color appBarColor ;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 0,
      elevation: 0,
      systemOverlayStyle:  SystemUiOverlayStyle(
          statusBarColor: appBarColor,
          statusBarIconBrightness: Brightness.dark),
    );
  }
}
