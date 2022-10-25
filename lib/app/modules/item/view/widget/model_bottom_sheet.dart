import 'package:flutter/material.dart';
import 'package:travel_aliga/app/modules/signin/views/widget/textfield.dart';

bottomSheet(BuildContext ctx) {
  TextEditingController emailController = TextEditingController();
  showModalBottomSheet(
    context: ctx,
    isScrollControlled: true,
    builder: (context) {
      return Padding(
        padding:  EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextfieldWidget(
                hint: 'Name', textcontroller: emailController, icon: Icons.email),
            TextfieldWidget(
                hint: 'Address', textcontroller: emailController, icon: Icons.email),
            TextfieldWidget(
                hint: 'City', textcontroller: emailController, icon: Icons.email),
            TextfieldWidget(
                hint: 'Pincode', textcontroller: emailController, icon: Icons.email,keyType: TextInputType.number),
            TextfieldWidget(
                hint: 'Age', textcontroller: emailController, icon: Icons.email,keyType: TextInputType.number,),
          ],
        ),
      );
    },
  );
}
