import 'package:flutter/material.dart';
import 'package:travel_aliga/app/modules/signin/views/widget/textfield.dart';

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
          decoration: CustomDecoration.inputdecoration(icon: icon,labelText: text)
        ),
      ),
    );
  }
}
