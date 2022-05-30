import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:zeta_fashion_application/LoginPage.dart';
import 'package:zeta_fashion_application/edit_products_screen.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        children: [
          Image.asset(
            "assets/loader.gif",
            height: 200,
            width: 500,
          ),
          const Text("ZETA FASHION",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
        ],
      ),
      nextScreen: const AdminScreenState(),
      splashIconSize: 250,
      duration: 4000,
      splashTransition: SplashTransition.fadeTransition,
      backgroundColor: Colors.black,
      // pageTransitionType: PageTransitionType.bottomToTop,
      animationDuration: const Duration(seconds: 1),
    );
  }
}

class AdminScreenState extends StatefulWidget {
  const AdminScreenState({Key? key}) : super(key: key);

  @override
  State<AdminScreenState> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreenState> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    void signout(){
      _auth.signOut();
    }
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: const Text(
          "Admin Screen",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: () => {
              signout(),
            },
            icon: const Icon(
              Icons.login_outlined,
              color: Colors.white,
            ),
          ),
        ],
      ),

      body: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(height: 50,),
              Center(
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xFFEFD47E),
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      minimumSize: const Size(200, 70),
                    ),
                    child: const Text(
                      "Add Products",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    )),
              ),
              SizedBox(height: 20,),
              Center(
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const EditProductScreen()));
                    },
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xFFEFD47E),
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      minimumSize: const Size(200, 70),
                    ),
                    child: const Text(
                      "Edit Products",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    )),
              ),

            ],
          )
        ],
      ),
    );
  }
}
