import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_aliga/app/routes/app_pages.dart';

class PaymentView extends StatelessWidget {
  PaymentView({
    Key? key,
    this.isSuccess = true,
    this.errorMessage = 'Failed',
    required this.orderId,
    required this.paymentId,
    required this.amount,
  }) : super(key: key);
  final bool isSuccess;
  final String errorMessage;
  final String orderId;
  final String paymentId;
  final int amount;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                isSuccess == true
                    ? WidgetPayment(
                        url: 'asset/image/sucess_payment.gif',
                        result: 'Payment Success',
                        message: 'Thank you for your payment',
                      )
                    : WidgetPayment(
                        url: 'asset/image/faliure_payment.gif',
                        result: 'Payment Failed',
                        message: errorMessage,
                      ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.35,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Visibility(
                            visible: isSuccess,
                            child: PaymentSlip(
                              title: 'Order ID',
                              value: orderId,
                            ),
                          ),
                          PaymentSlip(
                            title: 'Payment Id',
                            value: paymentId,
                          ),
                          PaymentSlip(
                            title: 'Amount',
                            value: '₹${amount - (0.18 * amount)}',
                          ),
                          PaymentSlip(
                            title: 'Tax&Fees',
                            value: '₹${amount * 0.18}',
                          ),
                          Divider(
                            color: Colors.grey,
                            thickness: 2,
                          ),
                          isSuccess == true
                              ? PaymentSlip(
                                  title: 'Total',
                                  value: '₹$amount',
                                  isTotal: true,
                                )
                              : PaymentSlip(
                                  title: 'Total',
                                  value: 'Failed',
                                  isTotal: true,
                                ),
                        ],
                      )),
                ),
               isSuccess == false? PaymentButton(onTap: () => Get.back(),text:'Try Again',):PaymentButton(onTap:()=> Get.offAllNamed(Paths.mainScreen),text: 'Continue',),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PaymentButton extends StatelessWidget {
  const PaymentButton({
    Key? key,
    required this.onTap,
    required this.text,
  }) : super(key: key);
 final Function()? onTap;
 final String text;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed:onTap,
      child: Text(
     text,
        textScaleFactor: 1.2,
      ),
      textColor: Colors.white,
      color: Color.fromARGB(255, 243, 115, 46),
      minWidth: double.infinity,
      height: MediaQuery.of(context).size.height * 0.06,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}

class WidgetPayment extends StatelessWidget {
  const WidgetPayment({
    Key? key,
    required this.url,
    required this.result,
    required this.message,
  }) : super(key: key);
  final String url;
  final String result;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          url,
          height: MediaQuery.of(context).size.height * 0.2,
          width: MediaQuery.of(context).size.width * 0.4,
        ),
        Text(
          result,
          textScaleFactor: 1.6,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          message,
          textScaleFactor: 1.2,
          textAlign: TextAlign.justify,
        ),
      ],
    );
  }
}

class PaymentSlip extends StatelessWidget {
  const PaymentSlip({
    Key? key,
    required this.title,
    required this.value,
    this.isTotal = false,
  }) : super(key: key);
  final String title;
  final String value;
  final bool isTotal;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        isTotal == false
            ? Text(
                title,
                textScaleFactor: 1.2,
              )
            : Text(
                title,
                textScaleFactor: 1.3,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
        isTotal == false
            ? Text(
                value,
                textScaleFactor: 1.2,
              )
            : Text(
                value,
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
                textScaleFactor: 1.3,
              )
      ],
    );
  }
}
