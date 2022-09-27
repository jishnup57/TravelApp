import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ant_design.dart';
import 'package:iconify_flutter/icons/bi.dart';
import 'package:travel_aliga/app/modules/Settings/controllers/settings_controller.dart';
import 'package:travel_aliga/app/utils/colors.dart';
import 'package:travel_aliga/app/utils/style.dart';

class MainAppBar extends StatelessWidget {
  const MainAppBar({
    Key? key,
    required this.title,
    this.isFilter = false,
    this.isSettings = false,
  }) : super(key: key);
  final String title;
  final bool isFilter;
  final bool isSettings;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppStyle.kAppBarTextStyle,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: isFilter == false
              ? CircleAvatar(
                  radius: height * .033,
                  backgroundColor: AppColor.kPrimaryColor,
                  child: Container(
                    width: height * .06,
                    height: height * .06,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColor.kWhiteColor,
                      image: DecorationImage(
                          image: AssetImage('asset/image/men.jpg'),
                          fit: BoxFit.cover),
                    ),
                  ),
                )
              : isSettings==false? IconButton(
                  onPressed: () {
                   
                  },
                  icon: const Iconify(
                    Bi.filter_square,
                    size: 28,
                  ),
                ): GestureDetector(
                  onTap: ()=>SettingsController.userLogout() ,
                  child: CircleAvatar(
                    radius: height * .03,
                    backgroundColor: AppColor.kWhiteColor,
                    child:  const Iconify(AntDesign.logout_outline,color: Colors.red,size: 30,),
                  ),
                ),
        )
      ],
    );
  }
}
