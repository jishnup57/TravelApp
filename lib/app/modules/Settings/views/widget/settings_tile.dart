
import 'package:flutter/material.dart';
import 'package:travel_aliga/app/utils/colors.dart';
import 'package:travel_aliga/app/utils/style.dart';

class SettingsTile extends StatelessWidget {
  const SettingsTile({
    Key? key,
    required this.title
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const CircleAvatar(
          child: Icon(Icons.wallet),
        ),
        Text(
          title,
          style: AppStyle.kCardTextStyle
              .copyWith(color: AppColor.kSecondaryColor, fontSize: 18),
        ),
        const Icon(
          Icons.arrow_forward_ios_rounded,
          color: AppColor.kSecondaryColor,
        )
      ],
    );
  }
}
