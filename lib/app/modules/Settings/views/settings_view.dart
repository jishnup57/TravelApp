import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ant_design.dart';
import 'package:iconify_flutter/icons/fluent.dart';
import 'package:iconify_flutter/icons/icons8.dart';
import 'package:iconify_flutter/icons/ion.dart';
import 'package:iconify_flutter/icons/mi.dart';
import 'package:travel_aliga/app/modules/Settings/views/widget/seperator.dart';
import 'package:travel_aliga/app/modules/Settings/views/widget/settings_tile.dart';
import 'package:travel_aliga/app/modules/widgets/appbar.dart';
import 'package:travel_aliga/app/modules/widgets/image_show.dart';
import 'package:travel_aliga/app/utils/colors.dart';
import 'package:travel_aliga/app/utils/style.dart';
import 'package:travel_aliga/app/utils/ui_helper/home_card_shimmer.dart';
import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  @override
  Widget build(BuildContext context) {
    final SettingsController controller = Get.put(SettingsController());
    final double height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Column(
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
        //  const Spacer(),
          Column(
            children: [
              Container(
                height: 250,
                width: 200,
                decoration: CommonWidget.imageShow(
                    url: 'asset/image/men.jpg', radius: 15),
              ),
              AppStyle.kHight8,
              GetBuilder<SettingsController>(builder: (context) {
                return controller.userDetails == null
                    ? CustomWidget(
                        hight: 20,
                        width: 140,
                        shapeBorder: ShapeDecoration(
                          color: Colors.grey[400],
                          shape: RoundedRectangleBorder(),
                        ),
                      )
                    : Text(
                        "${controller.userDetails!.firstName.toString()} ${controller.userDetails!.lastName.toString()}",
                        style: AppStyle.kWelcomeSmall
                            .copyWith(color: AppColor.kBlackColor, fontSize: 20),
                      );
              })
            ],
          ),
          SizedBox(
            height: height * 0.05,
          ),
          Container(
            decoration: const BoxDecoration(
              color: AppColor.kWhiteColor,
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
                SettingsTile(
                  title: 'My Tickets',
                  icon: Iconify(
                    Ion.ticket,
                    color: AppColor.kWhiteColor,
                  ),
                ),
                Seperator(),
                SettingsTile(
                  title: 'Profile Settings',
                  icon: Iconify(
                    AntDesign.user_outline,
                    color: AppColor.kWhiteColor,
                  ),
                ),
                Seperator(),
                SettingsTile(
                  title: 'Payments',
                  icon: Iconify(
                    Fluent.payment_16_regular,
                    color: AppColor.kWhiteColor,
                  ),
                ),
                Seperator(),
                SettingsTile(
                  title: 'My Cart',
                  icon: Iconify(
                    Icons8.shopping_cart,
                    color: AppColor.kWhiteColor,
                  ),
                ),
                Seperator(),
                SettingsTile(
                  title: 'Notifications',
                  icon: Iconify(
                    Mi.notification,
                    color: AppColor.kWhiteColor,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
