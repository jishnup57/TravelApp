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
  final String? Function(String? )? validator;
  final TextInputType keytype;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: SizedBox(
        child: TextFormField(
          validator: validator,     
          controller: controller,
          keyboardType: keytype,
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
          obscureText: obscureText,
          decoration: InputDecoration(
            fillColor: AppColor.kWhiteColor,
            filled: true,
            prefixIcon: Icon(
              icon,
              color: Colors.black,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: AppColor.kButtonColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Color(0xff0088d1),
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: AppColor.kFormfieldBorder,
              ),
            ),
            hintText: text,
            hintStyle: TextStyle(
              fontSize: 16,
              color: Colors.grey.withOpacity(.8),
            ),
          ),
        ),
      ),
    );
  }
}
