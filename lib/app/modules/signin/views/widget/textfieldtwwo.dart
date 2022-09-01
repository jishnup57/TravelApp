
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_aliga/app/modules/signin/controllers/signin_controller.dart';
import 'package:travel_aliga/app/utils/colors.dart';

class TextfieldWidget2 extends StatelessWidget {
  final String hint;
  final IconData icon;
  final TextEditingController controller;
  final TextInputType keyType;
  final bool obsecure;
  const TextfieldWidget2({
    required this.hint,
    required this.controller,
    required this.icon,
    required this.obsecure,
    this.keyType=TextInputType.emailAddress,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: AppColor.kFormfieldInside,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColor.kFormfieldBorder
        )
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: keyType,
        obscureText: obsecure,
        style: const TextStyle(
          height: 1.3,
          color: Colors.black,
          letterSpacing: .8,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
            prefixIcon: Icon(
            icon,
            color: Colors.black,
          ),
          suffixIcon: GestureDetector(
            onTap: (){
              Get.find<SigninController>().changeVisibility();
            },
            child: Icon(
              Get.find<SigninController>().secure==true? Icons.visibility:Icons.visibility_off,
              color: Colors.grey,
            ),
          ),
           hintText: hint,
          hintStyle: TextStyle(
            color: Colors.grey.withOpacity(.8),
            fontSize: 14,
          ),
          
        ),
      ),
    );
  }
}

