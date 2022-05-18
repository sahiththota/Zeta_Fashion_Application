import 'package:flutter/material.dart';


class StoreLocator extends StatefulWidget {
  const StoreLocator({Key? key}) : super(key: key);

  @override
  _StoreLocatorState createState() => _StoreLocatorState();
}

class _StoreLocatorState extends State<StoreLocator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Store Locations", style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal, color: Colors.white),),
      ),
    );
  }
}



