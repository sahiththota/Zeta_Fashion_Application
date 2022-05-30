import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CartScreenState(),
    );
  }
}

class CartScreenState extends StatefulWidget {
  const CartScreenState({Key? key}) : super(key: key);

  @override
  _CartScreenStateState createState() => _CartScreenStateState();
}

class _CartScreenStateState extends State<CartScreenState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart Screen"),
      ),
    );
  }
}
