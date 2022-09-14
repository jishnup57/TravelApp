import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/favorate_controller.dart';

class FavorateView extends GetView<FavorateController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FavorateView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'FavorateView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
