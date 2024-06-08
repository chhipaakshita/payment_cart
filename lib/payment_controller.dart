import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:get/get.dart';
class PaymentController extends GetxController{
  late Razorpay razorPay;

  void onInit(){
    super.onInit();
    razorPay = Razorpay();
    razorPay.on(Razorpay.EVENT_PAYMENT_SUCCESS,_handlePaymentSuccess);
    razorPay.on(Razorpay.EVENT_PAYMENT_ERROR,_handlePaymentError);
    razorPay.on(Razorpay.EVENT_EXTERNAL_WALLET,_handleExternalWallet);
  }
  void dispose(){
    super.dispose();
    razorPay.clear();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response){
    Get.snackbar('Payment Succesfull', response.orderId.toString()+"\n"+
        response.paymentId.toString()
        +"\n"+response.signature.toString());
  }
  void _handlePaymentError(PaymentFailureResponse response){
    Get.snackbar('payment occurr error', response.message.toString());

  }

  void _handleExternalWallet(ExternalWalletResponse response){
    Get.snackbar('External Wallet Successfull', response.walletName.toString());
  }

  void dispatchPayment(int amount,String name,String contact,
      String description,String email, String wallet
      ){
    var options ={
      'key': 'rzp_test_WNqzZQwBpWMvCb',
      'amount' : amount,
      'description' : description,
      'prefill' : {'contact':contact,'email':email},
      'external' : {'wallets':[wallet]}
    };
    try{
      razorPay.open(options);
    }catch (e){}
  }
}




