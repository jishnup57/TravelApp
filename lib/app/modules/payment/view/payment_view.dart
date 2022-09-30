import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_aliga/app/modules/payment/controller/payment_controller.dart';

class PaymentView extends StatelessWidget {
  PaymentView({Key? key}) : super(key: key);
final PaymentController controller = Get.put(PaymentController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
          
          },
          child: Text("Get User Details"),
        ),
      ),
    );
  }
}



/**+class PaymentView extends StatelessWidget {
  late Set<String> phoneAndEmail;
   PaymentView({Key? key}) : super(key: key) {
    print("object");
    phoneAndEmail = PaymentController().getPhoneAndEmail();

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
} */