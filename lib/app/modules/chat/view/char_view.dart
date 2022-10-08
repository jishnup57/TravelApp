import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:travel_aliga/app/modules/chat/controller/chat_controller.dart';
import 'package:travel_aliga/app/modules/chat/view/widget/chat_icon.dart';
import 'package:travel_aliga/app/modules/home/model/all_pakage_model.dart';
import 'package:travel_aliga/app/utils/colors.dart';
import 'package:travel_aliga/app/utils/style.dart';
import 'package:intl/intl.dart';

class ChatView extends StatelessWidget {
  ChatView({required this.item})
      : controller = Get.put(ChatController(item: item));
  final Result item;
  final ChatController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColor.kBlackColor,
          ),
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: AppColor.kScaffoldColor,
            statusBarIconBrightness: Brightness.dark),
        title: Text(
          "Reviews",
          textScaleFactor: 1.15,
          style: AppStyle.kCardTextStyle.copyWith(
            color: AppColor.kBlackColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: AppColor.kScaffoldColor,
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: MediaQuery.of(context).size.height / 9),
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overscroll) {
            overscroll.disallowIndicator();
            return true;
          },
          child: GetBuilder<ChatController>(builder: (controller) {
            if (controller.reviewList.isEmpty) {
              return Center(
                child: Text('No reviews'),
              );
            }
            return ListView.separated(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              itemBuilder: (context, index) {
                final value = controller.reviewList[index];
                final date = DateFormat.MMMd()
                    .add_jm()
                    .format(DateTime.parse(value.time));
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "'contactName'",
                          style: Theme.of(context).textTheme.caption,
                        ),
                        Container(
                          constraints: BoxConstraints(
                              maxWidth: MediaQuery.of(context).size.width * .6),
                          padding: const EdgeInsets.all(15.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(25),
                              bottomLeft: Radius.circular(25),
                              bottomRight: Radius.circular(25),
                            ),
                          ),
                          child: Text(
                            value.description,
                            style: TextStyle(
                              color: Colors.black87,
                              height: 1.4,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 15),
                    Text(
                      date,
                      style: TextStyle(color: Colors.black.withOpacity(0.4)),
                    ),
                  ],
                );
              },
              separatorBuilder: (context, index) => AppStyle.kHight10,
              itemCount: controller.reviewList.length,
            );
          }),
        ),
      ),
      bottomSheet: Container(
        margin: EdgeInsets.all(15.0),
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(35.0),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 3), blurRadius: 5, color: Colors.grey)
                  ],
                ),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.emoji_emotions_outlined),
                      onPressed: () {},
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: controller.chatContoller,
                        onChanged: (value) {
                          controller.changingWidgets(value);
                        },
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                        style: TextStyle(
                          overflow: TextOverflow.clip,
                          color: AppColor.kBlackColor,
                        ),
                        decoration: InputDecoration(
                            hintText: "Type Something...",
                            border: InputBorder.none),
                      ),
                    ),
                    ChatIconButton(icon: Icons.photo_camera),
                    ChatIconButton(icon: Icons.attach_file),
                  ],
                ),
              ),
            ),
            SizedBox(width: 15),
            InkWell(
              child: Container(
                decoration:
                    BoxDecoration(color: Colors.green, shape: BoxShape.circle),
                padding: EdgeInsets.all(8),
                child: Icon(
                  Icons.send,
                  size: 25,
                  color: Colors.white,
                ),
              ),
              onTap: () => controller.chat(),
            )
          ],
        ),
      ),
    );
  }
}
