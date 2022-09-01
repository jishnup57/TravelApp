
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_aliga/app/utils/colors.dart';

import '../../controllers/signup_controller.dart';

class SignUpTextforms extends StatelessWidget {
  const SignUpTextforms({
    Key? key,
    required this.icon,
    required this.text,
     this.obscureText=false,
    required this.vertical,
    required this.controller,
  }) : super(key: key);
  final IconData icon;
  final String text;
  final bool obscureText;
  final double vertical;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        // ignore: body_might_complete_normally_nullable
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please fill this field';
          }
        },
        controller: controller,
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

// class SignupForm extends StatelessWidget {
//   const SignupForm({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(25.0),
//       child: Form(
//         key: context.read<SignUpProvider>().signUpKey,
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             children: [
//               // const ImageProfileAdd(),
//               SignUpTextforms(
//                 icon: Icons.person_outline_outlined,
//                 text: "UserName",
//                 obscureText: false,
//                 vertical: 20,
//                 controller: context.read<SignUpProvider>().userName,
//               ),
//               SignUpTextforms(
//                 icon: Icons.mail_outline_sharp,
//                 text: "Email",
//                 obscureText: false,
//                 vertical: 15,
//                 controller: context.read<SignUpProvider>().email,
//               ),
//               SignUpTextforms(
//                 icon: Icons.send_to_mobile_rounded,
//                 text: "Phone",
//                 obscureText: false,
//                 vertical: 15,
//                 controller: context.read<SignUpProvider>().phoneNumber,
//               ),
//               PasswordTextforms(
//                 icon: Icons.lock_outline,
//                 text: "Password",
//                 obscureText: true,
//                 vertical: 15,
//                 controller: context.read<SignUpProvider>().password,
//               ),
//               PasswordTextforms(
//                 icon: Icons.lock_reset_outlined,
//                 text: "Confirm Password",
//                 obscureText: true,
//                 vertical: 15,
//                 controller: context.read<SignUpProvider>().confirmPassword,
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 10.0),
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 120,
//                       vertical: 15,
//                     ),
//                     primary: primary,
//                     elevation: 10,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(
//                         5,
//                       ),
//                     ),
//                   ),
//                   onPressed: () {
//                     context.read<SignUpProvider>().signUp(
//                           context,
//                           context.read<SignUpProvider>().email.text,
//                           context.read<SignUpProvider>().password.text,
//                           context.read<SignUpProvider>().userName.text,
//                           context.read<SignUpProvider>().phoneNumber.text,
//                           context.read<SignUpProvider>().confirmPassword.text,
//                         );
//                   },
//                   child: const Text(
//                     "SIGN UP",
//                   ),
//                 ),
//               ),
//               const Padding(
//                 padding: EdgeInsets.only(top: 8.0),
//                 child: SignUpButtons(primary: Colors.blue, text: "GOOGLE"),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class PasswordTextforms extends StatelessWidget {
  const PasswordTextforms({
    Key? key,
    required this.icon,
    required this.text,
    required this.obscureText,
    required this.vertical,
    required this.controller,
  }) : super(key: key);
  final IconData icon;
  final String text;
  final bool obscureText;
  final double vertical;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please fill this field';
          }
          if(value!=Get.find<SignupController>().passwordControlleer.text){
            return 'Password Not Match';
          }
          return null;

        },
        keyboardType: TextInputType.visiblePassword,
        controller: controller,
        style: TextStyle(
          color: Colors.grey,
          fontSize: 16,
        ),
        obscureText: obscureText,
        decoration: InputDecoration(
          fillColor: AppColor.kWhiteColor,
          filled: true,
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Icon(
              icon,
              color: Colors.red,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
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
            borderSide: BorderSide(
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