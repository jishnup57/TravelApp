import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentController extends GetxController {
   Razorpay razorpay = Razorpay();
  @override
  void onInit() {
    super.onInit();
   razorpay = Razorpay();
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }
   void _handlePaymentSuccess(PaymentSuccessResponse response) {
    print("Payment Success");
    print(response.paymentId);
  }
  

  _handlePaymentError(PaymentFailureResponse response) {
    print("Payment Error");
    print(response.code.toString());
    print(response.message);
  }

  _handleExternalWallet(ExternalWalletResponse response) {
    print("External Wallet");
    print(response.walletName);
  }
   option(String packageName,int price) async {
    final value = await getUserDetails();
   

    var options = {
      'key': "rzp_test_jG8FLjSJeRkNGh",
      'amount': price * 100,
      'name': 'On-Demand',
      'description':packageName,
      'prefill': {'contact': value.first, 'email': value.last},
      'timeout': 120,
      'modal': {
        'confirm_close': true,
        'external': {
          'wallets': ['paytm']
        }
      }
    };
    try {
      razorpay.open(options);
     
    } catch (e) {
      debugPrint(e.toString());
    }
  }

   Future< Set<String>> getUserDetails()async{
      FlutterSecureStorage st = FlutterSecureStorage();
    String phone = await st.read(key: "phone")??'';
    String email = await st.read(key: "email")??'';
    return {phone,email};
  }
  @override
  void onClose() {
 
    super.onClose();
    razorpay.clear();
  }
}