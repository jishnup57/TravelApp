
import 'package:flutter/material.dart';
import 'package:travel_aliga/app/utils/colors.dart';
import 'package:travel_aliga/app/utils/style.dart';

class SettingsTile extends StatelessWidget {
  const SettingsTile({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);
  final String title;
  final  Widget icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        AppStyle.kWidth,
         CircleAvatar(
          child:icon,
        ),
         AppStyle.kWidth15,
        Text(
          title,
          style: AppStyle.kCardTextStyle
              .copyWith(color: AppColor.kSecondaryColor, fontSize: 18),
        ),
        Spacer(),
         Icon(
           Icons.arrow_forward_ios_rounded,
          color: AppColor.kSecondaryColor,
        ),
         AppStyle.kWidth,
      ],
    );
  }
}
