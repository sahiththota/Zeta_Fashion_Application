import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:zeta_fashion_application/LoginPage.dart';
import 'package:zeta_fashion_application/admin_homepage.dart';
import 'package:zeta_fashion_application/checkout_screen.dart';
import 'package:zeta_fashion_application/home_page.dart';
import 'package:zeta_fashion_application/product_list.dart';
import 'package:zeta_fashion_application/productScreen.dart';
import 'package:zeta_fashion_application/store_locator.dart';
import 'package:zeta_fashion_application/wallet.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    const MaterialApp(
      home: NavState(),
    ),
  );
}

class NavState extends StatefulWidget {
  const NavState({Key? key}) : super(key: key);

  @override
  State<NavState> createState() => _NavStateState();
}

class _NavStateState extends State<NavState> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/main_layout': (context) => const LoginState(),
        '/page1': (context) => const HomePage(),
        '/page2': (context) => const ProductListState(),
        '/page3': (context) => const Wallet(),
        '/page4': (context) => const CheckoutScreen(),
        '/page5': (context) => const ProductScreen(),
        '/page6': (context) => const AdminPage(),
        '/page7': (context) => const StoreLocator(),
      },
      initialRoute: '/main_layout',
    );
  }
}
