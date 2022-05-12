import 'package:flutter/material.dart';
import 'package:zeta_fashion_application/home_page.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main(){
  runApp(const MaterialApp(
    home: CheckoutScreen(),
  ));
}


class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CheckoutScreenState(),
    );
  }
}


class CheckoutScreenState extends StatefulWidget {
  const CheckoutScreenState({Key? key}) : super(key: key);

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreenState> {

  late Razorpay _razorpay;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: SizedBox(
        width: MediaQuery.of(context).size.width,
        // ignore: deprecated_member_use
        child: RaisedButton(
            padding: const EdgeInsets.all(20),
            elevation: 3.0,
            color: Colors.deepOrange,
            onPressed: (){
              openCheckout();
            },
            child: const Text("Proceed to Payment", style: TextStyle(color: Colors.black),)
        ),
      ),
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title:
           const Text("Check Out"),
        actions:  [
          Align(
              alignment: Alignment.center,
              // ignore: deprecated_member_use
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orangeAccent,
                    elevation: 3,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                    minimumSize: const Size(25, 25),
                  ),
                onPressed: () =>{
                Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()))
              }, child: const Text("cancel", style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal, color: Colors.white),),

              )
          ),
        ],
      ),

      body: SizedBox(
        child:  SingleChildScrollView(
          child:  Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: 100,
                      child: AspectRatio(
                        aspectRatio: 0.88,
                        child: Container(
                          height: MediaQuery.of(context).size.width - 150,
                          decoration: BoxDecoration(
                            color: const Color(0xFFF5F6F9),
                            borderRadius: BorderRadius.circular(15),
                            image: const DecorationImage(
                              image: AssetImage("assets/men.jpg"),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(width: 20,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Text(
                              "Mens shirt by Puma", style: TextStyle(color: Colors.white, fontSize: 16,),
                              maxLines: 2,
                            ),
                            const SizedBox(width: 70,),
                            Container(
                              margin: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child:   const Icon(Icons.delete, size: 30, color: Colors.black,),
                            ),

                          ],
                        ),

                        const Text.rich(TextSpan(
                            text: "\$50.99", style: const TextStyle(fontWeight: FontWeight.w800, color: Colors.deepOrange),
                            children: [
                              const TextSpan(
                                  text: " x2",
                                  style: const TextStyle(color: Colors.white,)
                              )
                            ]
                        ))
                      ],
                    )

                  ], ),
              ),



              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: 100,
                      child: AspectRatio(
                        aspectRatio: 0.88,
                        child: Container(
                          height: MediaQuery.of(context).size.width - 150,
                          decoration: BoxDecoration(
                            color: const Color(0xFFF5F6F9),
                            borderRadius: BorderRadius.circular(15),
                            image: const DecorationImage(
                              image: const AssetImage("assets/men.jpg"),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(width:20,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Text(
                              "Mens shirt by Puma", style: const TextStyle(color: Colors.white, fontSize: 16,),
                              maxLines: 2,
                            ),
                            const SizedBox(width: 70,),
                            Container(
                              margin: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child:   const Icon(Icons.delete, size: 30, color: Colors.black,),
                            ),

                          ],
                        ),

                        const Text.rich(TextSpan(
                            text: "\$50.99", style: TextStyle(fontWeight: FontWeight.w800, color: Colors.deepOrange),
                            children: [
                              TextSpan(
                                  text: " x2",
                                  style: TextStyle(color: Colors.white,)
                              )
                            ]
                        ))
                      ],
                    )

                  ], ),
              ),




              const SizedBox(height: 50),
              // ElevatedButton(
              //     style: ElevatedButton.styleFrom(primary: Colors.orange,),
              //     onPressed: (){
              //       openCheckout();
              //     },
              //     child: Text("Proceed to Payment", style: TextStyle(color: Colors.black),))
            ],
          ),
        ),
      )
           );
  }


  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  void openCheckout() async {
    var options = {
      'key': 'rzp_live_ILgsfZCZoFIKMb',
      'amount': 100,
      'name': 'Acme Corp.',
      'description': 'Fine T-Shirt',
      'retry': {'enabled': true, 'max_count': 1},
      'send_sms_hash': true,
      'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: e');
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    print('Success Response: $response');
    Fluttertoast.showToast(
        msg: "SUCCESS: " + response.paymentId!,
        toastLength: Toast.LENGTH_SHORT);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print('Error Response: $response');
     Fluttertoast.showToast(
        msg: "ERROR: " + response.code.toString() + " - " + response.message!,
        toastLength: Toast.LENGTH_SHORT);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print('External SDK Response: $response');
     Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET: " + response.walletName!,
        toastLength: Toast.LENGTH_SHORT);
  }
}
