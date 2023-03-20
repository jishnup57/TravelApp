import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_aliga/app/modules/Favorate/controllers/favorate_controller.dart';
import 'package:travel_aliga/app/modules/Favorate/views/widget/favorite_card.dart';
import 'package:travel_aliga/app/modules/item/view/item_view.dart';
import 'package:travel_aliga/app/utils/style.dart';

class FavoriteSlider extends StatelessWidget {
  FavoriteSlider({
    Key? key,
  }) : super(key: key);
  final controller = Get.find<FavorateController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppStyle.kHight10,
        Expanded(
          child: SizedBox(
            child: GetBuilder<FavorateController>(
              builder: (controller) => controller.allFavorateList.isNotEmpty
                  ? ListView.builder(
                      itemBuilder: (context, index) {
                        final item = controller.favList[index];
                        return InkWell(
                          child: CardFavorite(
                            item: item,
                            favorateVisible: false,
                          ),
                          onTap: ()=>Get.to(()=>ItemView(item:item))
                        );
                      },
                      itemCount: controller.favList.length,
                    )
                  : Text('Please add favorite'),
            ),
          ),
        ),
      ],
    );
  }
}
