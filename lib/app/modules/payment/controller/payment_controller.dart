import 'dart:convert';
import 'dart:developer';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:travel_aliga/app/modules/home/model/all_pakage_model.dart';
import 'package:travel_aliga/app/modules/payment/model/error_model.dart';
import 'package:travel_aliga/app/modules/payment/model/payment_initialize.dart';
import 'package:travel_aliga/app/modules/payment/service/service_payment.dart';
import 'package:travel_aliga/app/modules/payment/view/payment_view.dart';

class PaymentController extends GetxController {
  Razorpay razorpay = Razorpay();
  late int price;
  late int addressID;
  late int packageID;
  late int slot;
  @override
  void onInit() {
    super.onInit();
    razorpay = Razorpay();
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    paymentInitialize();
    Get.to(PaymentView(
      orderId: response.orderId.toString(),
      paymentId: response.paymentId.toString(),
      amount: price,
    ));
  }

  _handlePaymentError(PaymentFailureResponse response) {
    log(response.message.toString());
    final parsedJson = jsonDecode(response.message.toString());
    final value = PaymentErrorModel.fromJson(parsedJson["error"]);
    Get.to(PaymentView(
      orderId: '',
      paymentId: value.metadata.paymentId,
      amount: price,
      isSuccess: false,
      errorMessage: value.description,
    ));
  }

  _handleExternalWallet(ExternalWalletResponse response) {
    log("External Wallet");
    log(response.walletName.toString());
  }

  option({required Result item,required int addressID,required int slot}) async {
    price = item.price;
    this.addressID = addressID;
    packageID = item.packageId;
    this.slot = slot;
    final value = await getUserDetails();

    var options = {
      'key': "rzp_test_jG8FLjSJeRkNGh",
      'amount': price * 100,
      'name': 'On-Demand',
      'description': item.packageName,
      'prefill': {'contact': value.first, 'email': value.last},
      'timeout': 120,
      'retry': {
        'enabled': false,
      },
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
      log(e.toString());
    }
  }

  Future<Set<String>> getUserDetails() async {
    FlutterSecureStorage st = FlutterSecureStorage();
    String phone = await st.read(key: "phone") ?? '';
    String email = await st.read(key: "email") ?? '';
    return {phone, email};
  }

  

paymentInitialize(){
  InitializeModel value = InitializeModel(
    amound: price,
    name: packageID,
    address: addressID,
    slot: slot,
  );
  log("/////////////////////////////////////////////////////////////////////////////////////");
  log(slot.toString());
  PaymentService().paymentInitialize(value);
}

  @override
  void onClose() {
    super.onClose();
    razorpay.clear();
  }
}
