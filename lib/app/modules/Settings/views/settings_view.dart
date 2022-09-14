import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:travel_aliga/app/modules/widgets/appbar.dart';
import 'package:travel_aliga/app/modules/widgets/image_show.dart';
import 'package:travel_aliga/app/utils/colors.dart';
import 'package:travel_aliga/app/utils/style.dart';

import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: MainAppBar(
            title: 'Settings',
            isSettings: true,
            isFilter: true,
          ),
        ),
        const Spacer(),
        Column(
          children: [
            Container(
              height: 250,
              width: 200,
              decoration: CommonWidget.imageShow(
                  url: 'asset/image/men.jpg', radius: 15),
            ),
            AppStyle.kHight8,
            Text(
              'David Beckham',
              style: AppStyle.kWelcomeSmall
                  .copyWith(color: AppColor.kBlackColor, fontSize: 20),
            )
          ],
        ),
        SizedBox(
          height: height * 0.05,
        ),
        Container(
          height: height * 0.4,
          decoration: const BoxDecoration(
            color:AppColor.kWhiteColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
          ),
          child: Column(
            children: const [
              Divider(
                height: 20,
                indent: 100,
                thickness: 5,
                endIndent: 100,
              ),
              SettingsTile(title: 'My Wallet'),
              Seperator(),
              SettingsTile(title: 'My Wallet'),
              Seperator(),
              SettingsTile(title: 'My Wallet'),
              Seperator(),
              SettingsTile(title: 'My Wallet'),
            ],
          ),
        )
      ],
    );
  }
}



class Seperator extends StatelessWidget {
  const Seperator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 20,
      thickness: 2,
      indent: 30,
      endIndent: 30,
    );
  }
}

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
