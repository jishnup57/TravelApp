import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_aliga/app/modules/home/controllers/category_controller.dart';
import 'package:travel_aliga/app/modules/item/view/item_view.dart';
import 'package:travel_aliga/app/modules/search/views/widget/search_card.dart';
import 'package:travel_aliga/app/modules/widgets/named_appbar.dart';

class CategoryItemsView extends StatelessWidget {
  CategoryItemsView({Key? key,required this.slugName}) :  controller = Get.put(CategoryItemsController(slugName: slugName));
 late final CategoryItemsController controller;
  final String slugName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, 50),
          child: NamedAppBar(title: slugName)),
      body: GetBuilder<CategoryItemsController>(
        builder: (controller) {
          return controller.isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              :controller.allPakagesList.isNotEmpty? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: GridView.builder(
                    itemCount: controller.allPakagesList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 8,
                      childAspectRatio: 0.85,
                    ),
                    itemBuilder: (context, index) {
                      final item = controller.allPakagesList[index];
                      return InkWell(
                        child: CardSearch(
                            item: item,
                          ),
                          onTap: () {
                            Get.to(()=>ItemView(item: item));
                          },
                      );
                      
                    },
                  ),
                ):Center(child: Text('No items'),);
        },
      ),
    );
  }
}
