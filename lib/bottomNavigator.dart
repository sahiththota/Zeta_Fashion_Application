import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:zeta_fashion_application/LoginPage.dart';
import 'package:zeta_fashion_application/checkout_screen.dart';
import 'package:zeta_fashion_application/productScreen.dart';
import 'package:zeta_fashion_application/home_page.dart';
import 'package:zeta_fashion_application/wallet.dart';



class BottomNavigationState extends StatefulWidget {
  const BottomNavigationState({Key? key}) : super(key: key);

  @override
  State<BottomNavigationState> createState() => _BottomNavigationStateState();
}

class _BottomNavigationStateState extends State<BottomNavigationState> {
  @override
  Widget build(BuildContext context) {

    GlobalKey _bottomNavigationKey = GlobalKey();
    // let _selectedIndex = ZetaFashionState();
    final _screens =  [
      HomePageState(),
      CheckoutScreen(),
      ProductScreen(),
    ];
    //

    int _selectedIndex = 0;

    void _onItemTapped(index) {
      setState(() {
        _selectedIndex = index;
      });
    }
    // ignore: constant_identifier_names
    const List<Widget> _Items = <Widget>[
      Icon(Icons.home, size: 30,),
      Icon(Icons.shopping_cart, size: 30,),
      Icon(Icons.person, size: 30,),
    ];


    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
          height: 50,
          key: _bottomNavigationKey,
          index: _selectedIndex,
          items : _Items,
          buttonBackgroundColor: Colors.red,
          backgroundColor: Colors.white,
          onTap: (index) => {
            setState(() => {
              _selectedIndex = index,
            }
            )}
      ),
    );
  }
}
