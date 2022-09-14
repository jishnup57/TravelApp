
import 'package:flutter/material.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
import 'package:travel_aliga/app/utils/colors.dart';
import 'package:travel_aliga/app/utils/style.dart';

class Tabbs extends StatelessWidget {
  const Tabbs({
    Key? key,
    required this.tabWidget,
  }) : super(key: key);
  final Widget tabWidget;
  @override
  Widget build(BuildContext context) {
    
    return DefaultTabController(
      length: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 60,
            width: 320,
            child: Material(
              color: AppColor.kScaffoldColor,
              child: TabBar(
                labelColor: AppColor.kPrimaryColor,
                unselectedLabelColor: Colors.black.withOpacity(.6),
               isScrollable: true,
                labelPadding: const EdgeInsets.symmetric(horizontal: 8),
                tabs: const [
                  Text('Sights', style: AppStyle.kTabStyle),
                  Text('Tours', style: AppStyle.kTabStyle),
                  Text('Adventure', style: AppStyle.kTabStyle),
                ],
                indicator: DotIndicator(
                  color: AppColor.kPrimaryColor,
                  distanceFromCenter: 22,
                  radius: 5,
                ),
              ),
            ),
          ),
         tabWidget,
        ],
      ),
    );
  }
}


