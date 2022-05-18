import 'package:flutter/material.dart';
import 'home_page.dart';


class Wallet extends StatelessWidget {
  const Wallet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WalletState(),
    );
  }
}


class WalletState extends StatefulWidget {
  const WalletState({Key? key}) : super(key: key);

  @override
  _WalletStateState createState() => _WalletStateState();
}

class _WalletStateState extends State<WalletState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(

        backgroundColor: Colors.black,
        title: const Text("Wallet", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),),

        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ), onPressed: ()=>
        {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HomePage()))
        },
        ),
      ),

      body: Stack(
        children: <Widget>[

          Expanded(
              child: Column(

                children: [
                Align(
                child: Column(
                children: <Widget>[
      GestureDetector(
      onTap: () => {},
      child: Container(
        padding: const EdgeInsets.all(20),
        height: 300,
        width: 400,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),),

        child: const Text("Amount available : ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, ),),
      ),
    ),

                  const SizedBox(height: 20,),
                  GestureDetector(
                    onTap: () => {},
                    // ignore: deprecated_member_use
                    child: RaisedButton(
                    elevation: 5.0,
                    onPressed: () {
                    Navigator.push(context,
                    MaterialPageRoute(builder: (context) =>  const HomePage()));
                    },
                    padding: const EdgeInsets.all(15.0),
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    ),
                    color: Colors.white,
                    child: const Text(
                    "CASHOUT",
                    style:  TextStyle(
                    color: Colors.black,
                    letterSpacing: 1.0,
                    fontSize: 20,

                    ),
                    ),
                    ),

    ),




                ],
          ))
          ],
            ),
                ),
    ]),
    );

  }
}
