
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_aliga/app/modules/chat/controller/chat_controller.dart';

class ChatIconButton extends StatelessWidget {
   ChatIconButton({
    Key? key,
    required this.icon,
  }) : super(key: key);
  final IconData icon;
  final ChatController controller = Get.find<ChatController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Visibility(
        visible: controller.visibleIcon.value,
        child: IconButton(
          icon: Icon(icon),
          onPressed: () {},
        ),
      ),
    );
  }
}
