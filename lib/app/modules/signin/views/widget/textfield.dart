
import 'package:flutter/material.dart';

class TextfieldWidget extends StatelessWidget {
  final String hint;
  final IconData icon;
  final TextEditingController controller;
  final TextInputType keyType;
  const TextfieldWidget({
    required this.hint,
    required this.controller,
    required this.icon,
    this.keyType=TextInputType.emailAddress,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(.3),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: controller,
        keyboardType: keyType,
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
