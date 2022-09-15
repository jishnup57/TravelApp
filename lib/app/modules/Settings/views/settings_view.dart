import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_aliga/app/modules/Settings/views/widget/seperator.dart';
import 'package:travel_aliga/app/modules/Settings/views/widget/settings_tile.dart';
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



