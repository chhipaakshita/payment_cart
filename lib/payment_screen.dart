
import 'package:flutter/material.dart';
import 'package:payment_cart/payment_controller.dart';
import 'package:get/get.dart';
class PaymentScreen extends StatelessWidget {

final PaymentController pc = Get.put(PaymentController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Razorpay'),),
      body: Center(
        child: ElevatedButton(onPressed: (){
            pc.dispatchPayment(20000, 'ak', '9876543212', 'aslkfhv', 'chhipaakshita913@gmail.com', 'paytm');
        }, child: Text('total payment: 200',style: TextStyle(fontSize: 20),)),
      ),
    );
  }
}
