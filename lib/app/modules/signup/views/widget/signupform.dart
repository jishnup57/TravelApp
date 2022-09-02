import 'package:flutter/material.dart';
import 'package:travel_aliga/app/utils/colors.dart';

class SignUpTextforms extends StatelessWidget {
  const SignUpTextforms({
    Key? key,
    required this.icon,
    required this.text,
    this.obscureText = false,
    required this.vertical,
    required this.controller,
    this.validator,
    this.keytype=TextInputType.emailAddress,
  }) : super(key: key);
  final IconData icon;
  final String text;
  final bool obscureText;
  final double vertical;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType keytype;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        validator: validator,     
        controller: controller,
        keyboardType: keytype,
        style: TextStyle(
          color: Colors.grey,
          fontSize: 18,
        ),
        obscureText: obscureText,
        decoration: InputDecoration(
          fillColor: AppColor.kWhiteColor,
          filled: true,
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Icon(
              icon,
              color: Colors.red,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.grey,
              width: 2.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.teal,
              width: 2.0,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.grey,
              width: 2.0,
            ),
          ),
          hintText: text,
          hintStyle: TextStyle(
            fontSize: 15,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
