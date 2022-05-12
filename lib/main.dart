import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zeta_fashion_application/LoginPage.dart';
import 'package:zeta_fashion_application/admin_homepage.dart';
import 'package:zeta_fashion_application/checkout_screen.dart';
import 'package:zeta_fashion_application/home_page.dart';
import 'package:zeta_fashion_application/product_list.dart';
import 'package:zeta_fashion_application/productScreen.dart';
import 'package:zeta_fashion_application/wallet.dart';


void main() {

  runApp(const MaterialApp(
      home: NavState(),
  ),
  );
}


class NavState extends StatefulWidget {
  const NavState({Key? key}) : super(key: key);

  @override
  _NavStateState createState() => _NavStateState();
}

class _NavStateState extends State<NavState> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/main_layout': (context) => const LoginState(),
        '/page1': (context) => const HomePage(),
        '/page2': (context) =>  MenFashion(),
        '/page3': (context) => const Wallet(),
        '/page4': (context) => const CheckoutScreen(),
        '/page5': (context) =>  ProductScreen(),
        '/page6': (context) => const AdminPage(),

      },
      initialRoute: '/main_layout',
    );
  }
}
