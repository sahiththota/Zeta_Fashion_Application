import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_place/google_place.dart';
import 'package:zeta_fashion_application/LoginPage.dart';
import 'package:zeta_fashion_application/data.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'data.dart';
import 'package:http/http.dart' as http;

class CheckoutScreen extends StatelessWidget implements LoginState {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CheckoutScreenState();
  }
}

class CheckoutScreenState extends StatefulWidget {
  const CheckoutScreenState({Key? key}) : super(key: key);

  @override
  State<CheckoutScreenState> createState() => _CheckoutScreenState();
}

Future sendEmail() async {
  final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");
  const serviceId = "service_911a8tk";
  const templateId = "template_51fkett";
  const userId = "3g0a8wtkPE436ucbB";
  const accessToken = "ER-VeALgFY3BGGiV0MDo7";
  final response = await http.post(url,
      headers: {"Content-Type": "application/json"},
      body: json.encode({
        "service_id": serviceId,
        "template_id": templateId,
        "user_id": userEmail,
        "accessToken": accessToken,
        "template_params": {'email': userEmail}
      }));
  print("???????????????????????????????????????????");
  print(response.body.toString());
  return response.statusCode;
}

class _CheckoutScreenState extends State<CheckoutScreenState> {
  late Razorpay _razorpay;

  final _startSearchFieldController = TextEditingController();

  late GooglePlace googlePlace;
  List<AutocompletePrediction> predictions = [];
  Timer? _debounce;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    String apiKey = 'AIzaSyAxOZM8mTmaGMFFw2cmoX1PLLIai9OakfQ';
    googlePlace = GooglePlace(apiKey);

    print(apiKey);

    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void autoCompleteSearch(String value) async {
    print(value);
    var result = await googlePlace.autocomplete.get(value);
    print(result!.status);
    if (result != null && result.predictions != null && mounted) {
      print(result.predictions);
      print(result.predictions!.first.description);
      setState(() {
        predictions = result.predictions!;
        print("workingfine");
      });
    }
  }

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
              onPressed: () {
                openCheckout();
                sendEmail();
              },
              child: const Text(
                "Proceed to Payment",
                style: TextStyle(color: Colors.black),
              )),
        ),
        backgroundColor: Colors.black,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          title: const Text("Check Out"),
          // actions: [
          //   Align(
          //       alignment: Alignment.center,
          //       // ignore: deprecated_member_use
          //       child: ElevatedButton(
          //         style: ElevatedButton.styleFrom(
          //           primary: Colors.orangeAccent,
          //           elevation: 3,
          //           shape: RoundedRectangleBorder(
          //               borderRadius: BorderRadius.circular(10.0)),
          //           minimumSize: const Size(25, 25),
          //         ),
          //         onPressed: () => {
          //           Navigator.push(context, MaterialPageRoute(builder: (context) => HomePageState( )))
          //         },
          //         child: const Text(
          //           "cancel",
          //           style: TextStyle(
          //               fontSize: 15,
          //               fontWeight: FontWeight.normal,
          //               color: Colors.white),
          //         ),
          //       )),
          // ],
        ),
        body: SizedBox(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: _startSearchFieldController,
                    autofocus: false,
                    style: TextStyle(fontSize: 18, color: Colors.white),
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.fromLTRB(10.0, 5.0, 5.0, 10.0),
                        hintText: 'Enter Address',
                        hintStyle: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: Colors.white),
                        filled: true,
                        fillColor: Colors.transparent,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                    onChanged: (value) {
                      if (_debounce?.isActive ?? false) _debounce!.cancel();
                      _debounce = Timer(const Duration(milliseconds: 1000), () {
                        print("value is good");
                        autoCompleteSearch(value);
                      });
                    },
                  ),
                ),

                ListView.builder(
                    shrinkWrap: true,
                    itemCount: predictions.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          _startSearchFieldController.text =
                              predictions[index].description!;
                          predictions = [];
                          setState(() {});
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Text(
                            predictions[index].description!,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 16),
                          ),
                        ),
                      );
                    }),

                // Padding(
                //   padding: const EdgeInsets.all(15.0),
                //   child: Row(
                //     children: [
                //       SizedBox(
                //         width: 100,
                //         child: AspectRatio(
                //           aspectRatio: 0.88,
                //           child: Container(
                //             height: MediaQuery.of(context).size.width - 150,
                //             decoration: BoxDecoration(
                //               color: const Color(0xFFF5F6F9),
                //               borderRadius: BorderRadius.circular(15),
                //               image: const DecorationImage(
                //                 image: AssetImage("assets/men.jpg"),
                //                 fit: BoxFit.contain,
                //               ),
                //             ),
                //           ),
                //         ),
                //       ),
                //
                //       const SizedBox(width: 20,),
                //       Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           Row(
                //             children: [
                //               const Text(
                //                 "Mens shirt by Puma", style: TextStyle(color: Colors.white, fontSize: 16,),
                //                 maxLines: 2,
                //               ),
                //               const SizedBox(width: 70,),
                //               Container(
                //                 margin: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
                //                 decoration: BoxDecoration(
                //                   color: Colors.white,
                //                   borderRadius: BorderRadius.circular(15),
                //                 ),
                //                 child:   const Icon(Icons.delete, size: 30, color: Colors.black,),
                //               ),
                //
                //             ],
                //           ),
                //
                //           const Text.rich(TextSpan(
                //               text: "\$50.99", style: const TextStyle(fontWeight: FontWeight.w800, color: Colors.deepOrange),
                //               children: [
                //                 const TextSpan(
                //                     text: " x2",
                //                     style: const TextStyle(color: Colors.white,)
                //                 )
                //               ]
                //           ))
                //         ],
                //       )
                //
                //     ], ),
                // ),

                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                width: 100,
                                child: AspectRatio(
                                  aspectRatio: 0.88,
                                  child: Container(
                                    height:
                                        MediaQuery.of(context).size.width - 150,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFF5F6F9),
                                      borderRadius: BorderRadius.circular(15),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            products[index].imageUrl ?? ''),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                child: Column(
                                  children: [
                                    Text(
                                      products[index].name ?? '',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      maxLines: 2,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text.rich(TextSpan(
                                        text: "\$${products[index].price}",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w800,
                                            fontSize: 18,
                                            color: Colors.deepOrange),
                                        children: [
                                          TextSpan(
                                              text:
                                                  "\t X ${products[index].quantity}",
                                              style: TextStyle(
                                                color: Colors.white,
                                              ))
                                        ])),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                margin: const EdgeInsets.fromLTRB(
                                    0.0, 10.0, 0.0, 10.0),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15),
                                    border:
                                        Border.all(color: Colors.redAccent)),
                                child: IconButton(
                                  icon: const Icon(
                                    Icons.delete,
                                    size: 30,
                                    color: Colors.black,
                                  ),
                                  onPressed: () {
                                    products.removeAt(index);
                                    setState(() {});
                                  },
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
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
        ));
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
    predictions.clear();
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
        'wallets': ['Interac']
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
