import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zeta_fashion_application/admin_homepage.dart';
import 'package:zeta_fashion_application/home_page.dart';
import 'package:zeta_fashion_application/signup_page.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'data.dart';

class LoginState extends StatelessWidget {
  const LoginState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Container(
        child: Column(
          children: [
            Image.asset(
              "assets/zeta.jpg",
              height: 150,
              width: double.infinity,
            ),
            const Text("ZETA FASHION",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ],
        ),
      ),
      nextScreen: const ZetaFashionState(),
      splashIconSize: 250,
      duration: 4000,
      splashTransition: SplashTransition.decoratedBoxTransition,
      backgroundColor: Colors.black38,
      // pageTransitionType: PageTransitionType.bottomToTop,
      animationDuration: const Duration(seconds: 1),
    );
  }
}

class ZetaFashionState extends StatefulWidget {
  const ZetaFashionState({Key? key}) : super(key: key);

  @override
  _ZetaFashionStateState createState() => _ZetaFashionStateState();
}

class _ZetaFashionStateState extends State<ZetaFashionState> {
  //Creating firebase auth
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    TextEditingController _emailC = TextEditingController();
    TextEditingController _paswordC = TextEditingController();
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            color: Colors.black,
            height: double.infinity,
            width: double.infinity,
          ),
          Container(
            height: double.infinity,
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(
                horizontal: 40.0,
                vertical: 100.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Center(
                    child: Text(
                      "ZETA-FASHION",
                      style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          letterSpacing: 5,
                          fontFamily: "OpenSans",
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          shadows: <Shadow>[
                            Shadow(
                              offset: Offset(5.5, 2.2),
                              blurRadius: 3.0,
                              color: Colors.red,
                            ),
                          ]),
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Center(
                    child: Text(
                      "SIGN IN",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "OpenSans",
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                        "Email",
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: "OpenSans",
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black,
                              blurRadius: 2.0,
                              spreadRadius: 0.0,
                              offset: Offset(
                                  2.0, 2.0), // shadow direction: bottom right
                            )
                          ],
                        ),
                        height: 60,
                        child: TextFormField(
                          controller: _emailC,
                          onSaved: (value) {
                            _emailC.text = value!;
                          },
                          keyboardType: TextInputType.emailAddress,
                          style: const TextStyle(
                              color: Colors.black, fontSize: 25.0),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(top: 7.0),
                            prefixIcon: Icon(
                              Icons.email,
                            ),
                            hintText: "Enter Email Id",
                            hintStyle: TextStyle(
                              fontSize: 25.0,
                              color: Colors.grey,
                              fontFamily: "OpenSans",
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          "Password",
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: "OpenSans",
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        Container(
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: Colors.white,
                            boxShadow: [
                              const BoxShadow(
                                color: Colors.black,
                                blurRadius: 2.0,
                                spreadRadius: 0.0,
                                offset: Offset(
                                    2.0, 2.0), // shadow direction: bottom right
                              )
                            ],
                          ),
                          height: 60,
                          child: TextFormField(
                            controller: _paswordC,
                            onSaved: (value) {
                              _paswordC.text = value!;
                            },
                            obscureText: true,
                            keyboardType: TextInputType.text,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 25.0),
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(top: 7.0),
                                prefixIcon: Icon(
                                  Icons.password,
                                ),
                                hintText: "Enter Password",
                                hintStyle: TextStyle(
                                  fontSize: 25.0,
                                  color: Colors.grey,
                                  fontFamily: "OpenSans",
                                )),
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Column(
                          children: [
                            Container(
                              alignment: Alignment.centerRight,
                              // ignore: deprecated_member_use
                              child: FlatButton(
                                onPressed: () => {
                                  Fluttertoast.showToast(
                                      msg:
                                          "Reset mail sent to registered mail Id ",
                                      toastLength: Toast.LENGTH_LONG,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white,
                                      fontSize: 16.0),
                                },
                                child: const Text(
                                  "Forgot Password?",
                                  style: TextStyle(
                                      fontSize: 20.0, color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30.0),
                        Container(

                          padding: const EdgeInsets.symmetric(
                              vertical: 0.0, horizontal: 40.0),
                          width: double.infinity,
                          // ignore: deprecated_member_use
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: const Color(0xFFEFD47E),
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              minimumSize: Size(50, 50),
                            ),
                            onPressed: () {
                              signIn(_emailC.text, _paswordC.text);
                              Fluttertoast.showToast(msg: "Login Successful");
                            },
                            child: const Text(
                              "LOGIN",
                              style: TextStyle(
                                color: Colors.black,
                                letterSpacing: 2.0,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ]),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(height: 150),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        "Don't have an account? ",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignUppage()))
                        },
                        child: const Text(
                          "SignUp",
                          style: TextStyle(
                            letterSpacing: 1.2,
                            color: Colors.red,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Admin Page? ",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const AdminPage()))
                        },
                        child: const Text(
                          "Click here",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            letterSpacing: 1,
                            color: Colors.lime,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void signIn(String email, String password) async {
    await _auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((uid) => {
              print("Login Successful"),
              userEmail = email,
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomePage()))
            });
  }

  void _showToast(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          "email/password is incorrect. Try again",
          style: TextStyle(fontSize: 20, color: Colors.black),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.white,
        duration: Duration(seconds: 3),
        shape: StadiumBorder(),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
