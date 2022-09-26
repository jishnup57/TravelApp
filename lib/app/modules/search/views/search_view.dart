import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:travel_aliga/app/modules/search/views/widget/search_card.dart';
import 'package:travel_aliga/app/modules/search/views/widget/search_idel_widget.dart';
import 'package:travel_aliga/app/utils/colors.dart';

import '../../widgets/appbar.dart';
import '../controllers/search_controller.dart';

class SearchView extends StatelessWidget {
  final controller = Get.put(SearchController());
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 60,
            backgroundColor: AppColor.kScaffoldColor,
            elevation: 0,
            floating: true,
            pinned: true,
            snap: false,
            centerTitle: false,
            title: const MainAppBar(title: 'Search'),
            bottom: AppBar(
              backgroundColor: AppColor.kScaffoldColor,
              elevation: 0,
              toolbarHeight: 70,
              title: Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: width - 100,
                      height: 50,
                      decoration: BoxDecoration(
                        color: AppColor.kWhiteColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: TextFormField(
                          onChanged: (value) {
                            if (value.isEmpty) {
                              return;
                            }

                            controller.onSearchAction(value);
                          },
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                              hintText: 'Where do you want to go?',
                              border: InputBorder.none,
                              // prefixIcon: Icon(Icons.search),
                              suffixIcon: Icon(Icons.search)),
                        ),
                      ),
                    ),
                    Container(
                      width: 48,
                      height: 50,
                      decoration: BoxDecoration(
                        color: AppColor.kWhiteColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Image(
                          image:
                              AssetImage('asset/image/icons-google-maps.png'),
                          width: 35,
                          height: 35,
                          alignment: Alignment.center,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Obx(
            () {
              if (controller.searchResultList.isEmpty) {
                return SearchIdleWidget();
              } else {
                return SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 8,
                    childAspectRatio: 0.85,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final item = controller.searchResultList[index];
                      return CardSearch(
                        item: item,
                      );
                    },
                    childCount: controller.searchResultList.length,
                  ),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
