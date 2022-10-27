import 'package:flutter/material.dart';
import 'package:travel_aliga/app/utils/colors.dart';

class TextfieldWidget extends StatelessWidget {
  final String hint;
  final IconData icon;
  final TextEditingController textcontroller;
  final TextInputType keyType;
  final int maxLines;
  const TextfieldWidget({
    required this.hint,
    required this.textcontroller,
    required this.icon,
    this.keyType = TextInputType.emailAddress,
    this.maxLines = 1,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return
        TextFormField(
      controller: textcontroller,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please fill this field';
        }
        return null;
      },
      keyboardType: keyType,
      maxLines: maxLines,
      minLines: 1,
      style: const TextStyle(
        height: 1.3,
        color: Colors.black,
        letterSpacing: .8,
      ),
      decoration: CustomDecoration.inputdecoration(icon: icon, labelText: hint),
    );
  }

  
}

class CustomDecoration {
 static InputDecoration inputdecoration(
      {String? labelText, IconData? icon,}) {
    return InputDecoration(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      labelStyle: const TextStyle(color: Colors.black, letterSpacing: 1),
      fillColor: AppColor.kFormfieldInside,
      filled: true,
      hintText: labelText,
      hintStyle: TextStyle(
        color: Colors.grey.withOpacity(.8),
        fontSize: 14,
      ),
      prefixIcon: Icon(
        icon,
        color: Colors.black,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: AppColor.kButtonColor,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: AppColor.kButtonColor,
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: AppColor.kButtonColor,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: AppColor.kButtonColor,
        ),
      ),
    );
  }
}