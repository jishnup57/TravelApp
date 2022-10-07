import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_aliga/app/modules/chat/sevice/chat_service.dart';
import 'package:travel_aliga/app/modules/home/model/all_pakage_model.dart';
import 'package:travel_aliga/app/utils/error_dialog.dart';

class ChatController extends GetxController {
  ChatController({required this.item});
  final Result item;

  @override
  void onInit() {
    super.onInit();
    updateList();
  }

  List<Review> reviewList = [];
  TextEditingController chatContoller = TextEditingController();
  updateList() {
    reviewList.clear();
    for (var x in item.reviews) {
      reviewList.add(x);
    }
    update();
  }

  chat() async {
    if (chatContoller.text.trim().isEmpty) {
      return;
    }
    final obj = Review(
      id: item.packageId,
      rating: 3,
      description: chatContoller.text.trim(),
      active: true,
      package: item.packageId,
      time: '',
    );
    chatContoller.clear();
    final response = await ChatApi().addReview(obj);
    if (response != null) {
      reviewList.add(response);
      update();
    } else {
       ErrorDialoge.showSnakBar('Something Wrong!');
    }
  }
}
