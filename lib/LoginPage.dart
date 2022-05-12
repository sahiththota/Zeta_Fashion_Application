import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:zeta_fashion_application/home_page.dart';
import 'package:zeta_fashion_application/signup_page.dart';


class ZetaFashion extends StatefulWidget {
  const ZetaFashion({Key? key}) : super(key: key);

  @override
  _ZetaFashionState createState() => _ZetaFashionState();
}

class _ZetaFashionState extends State<ZetaFashion> {

  //Initalizing firebase
  Future<FirebaseApp> _intializeFirebase() async{
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _intializeFirebase(),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.done){
            return ZetaFashionState();
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      ),
    );
  }
}


class ZetaFashionState extends StatefulWidget {
  const ZetaFashionState({ Key? key }) : super(key: key);

  @override
  State<ZetaFashionState> createState() => _ZetaFashionStateState();
}

class _ZetaFashionStateState extends State<ZetaFashionState> {

  //Creating Logon function
  static Future<User?> loginUsingEmailPassword(
      {required String email, required String password, required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try{
      UserCredential userCredentials = await auth.signInWithEmailAndPassword(email: email, password: password);
      user = userCredentials.user;
    }
    on FirebaseAuthException catch(e){
      if(e.code == "user-not-fount"){
        print("No User found with this email");
      }
    }
    return user;

      }



  @override
  Widget build(BuildContext context) {
    TextEditingController _emailC = TextEditingController();
    TextEditingController _paswordC = TextEditingController();
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration:  const BoxDecoration(
              gradient:  LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                   Color(0xFF000000),
                  Color(0xFF000000),
                  Color(0xFF000000),
                  Color(0xFF000000),

                ],
                stops: [0.1,0.4,0.7,0.9],

              )
            ),
          ),

          Container(
            height: double.infinity,
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(
                horizontal: 40.0,
                vertical: 120.0,

              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  const Center(
                    child:
                    Text("ZETA-FASHION",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "OpenSans",
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                          shadows: <Shadow>[
                              Shadow(
                                  offset: Offset(2.0, 2.0),
                                  blurRadius: 3.0,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                     ),
                      ]),),),

                  const SizedBox(height: 20),
                  const Center(
                  child: Text("SIGN IN",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: "OpenSans",
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,

                  ),),),
                 const SizedBox(height: 30.0),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                          "Email",
                        style:
                         TextStyle(
                          color: Colors.black,
                          fontFamily: "OpenSans",
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10,),
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
                              offset: Offset(2.0, 2.0), // shadow direction: bottom right
                            )
                          ],
                        ),
                        height: 60,
                        child:  TextField(
                          controller: _emailC,
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(color: Colors.black, fontSize: 25.0),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(top: 7.0),
                            prefixIcon: Icon(
                            Icons.email,
                          ),
                              hintText: "Enter Email Id",
                              hintStyle: TextStyle(fontSize: 25.0, color: Colors.grey, fontFamily: "OpenSans", )
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30.0,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                        "Password",
                        style:
                         TextStyle(
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
                              offset: Offset(2.0, 2.0), // shadow direction: bottom right
                            )
                          ],
                        ),
                        height: 60,
                        child:  TextField(
                          controller: _paswordC,
                          obscureText: true,
                          keyboardType: TextInputType.text,
                          style: TextStyle(color: Colors.black, fontSize: 25.0),
                          decoration:  InputDecoration(
                            border: InputBorder.none,
                            contentPadding:  EdgeInsets.only(top: 7.0),
                            prefixIcon: Icon(
                              Icons.password,
                            ),
                            hintText: "Enter Password",
                            hintStyle: TextStyle(fontSize: 25.0, color: Colors.grey, fontFamily: "OpenSans", )
                          ),
                        ),
                      ),

                       const SizedBox(height:  20.0,),


                      Column(
                        children: [

                          Container(
                            alignment: Alignment.centerRight,
                            // ignore: deprecated_member_use
                            child: FlatButton(onPressed: () => {},
                            child: const Text(
                              "Forgot Password?",
                              style: TextStyle(fontSize: 20.0, color: Colors.white),
                            ),
                            ),
                          ),
                        ],
                      ),
                       const SizedBox(height: 30.0),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 40.0),
                         width: double.infinity,
                        // ignore: deprecated_member_use
                        child: RaisedButton(
                          elevation: 5.0,
                            onPressed: () async {
                             User? user = await loginUsingEmailPassword(email: _emailC.text, password: _paswordC.text, context: context);
                             print(user);
                             if(user != null){
                               Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> HomePage()));
                             }
                             else{
                               _showToast(context);
                             }
                            },
                          padding: const EdgeInsets.all(15.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          color: Colors.white,
                          child: const Text(
                            "LOGIN",
                            style:  TextStyle(
                              color: Colors.black,
                              letterSpacing: 1.0,
                              fontSize: 20,

                            ),
                          ),
                        ),
                        ),
                      const SizedBox(height: 20,),

                          Container(
                            alignment: Alignment.center,
                            child: Column(
                              children: <Widget>[
                              const Text("-OR-",
                              style:  TextStyle(fontSize: 20),
                            ),
                                const SizedBox(height: 20,),
                                const Text("Sign in with :", style: TextStyle(fontSize: 20, color:Colors.white),)
                          ]),
                        
                      ),
                      const SizedBox(height: 20),


                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () =>  print("Login with facebook"),
                              child: Container(
                                height: 60,
                                  width: 60,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                    boxShadow: [
                                       BoxShadow(
                                        color: Colors.black,
                                        offset:  Offset(0,2),
                                        blurRadius: 6.0,
                                      ),
                                    ],
                                    image: DecorationImage(
                                      image: AssetImage('assets/facebook.jpg'),
                                    )
                                  ),
                              ),
                            ),


                            GestureDetector(
                              onTap: () =>  print("Login with Google"),
                              child: Container(
                                height: 80,
                                width: 80,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black,
                                        offset: Offset(0,3),
                                        blurRadius: 9.0,
                                      ),
                                    ],

                                    image: DecorationImage(
                                      image: AssetImage("assets/google.jpg"),
                                    )
                                ),

                              ),
                            ),


                            GestureDetector(
                              onTap: () =>  print("Login with apple"),
                              child: Container(
                                height: 60,
                                width: 60,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black,
                                        offset: Offset(0,2),
                                        blurRadius: 6.0,
                                      ),
                                    ],
                                    image: DecorationImage(
                                      image: AssetImage('assets/apple.jpg'),
                                    )
                                ),
                              ),
                            ),



                          ],
                        ),

                      const SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                               Text(
                                 "Don't have an account? ",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                                GestureDetector(
                                  onTap: () => {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUppage()))
                                  },
                                  child: Text("SignUp",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),

                            ],
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
}



void _showToast(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(

    content: Text("email/password is incorrect. Try again",
      style: TextStyle(fontSize: 20, color: Colors.black),
      textAlign: TextAlign.center,
    ),
    backgroundColor: Colors.white,
    duration: Duration(seconds: 3),
    shape: StadiumBorder(),
    behavior: SnackBarBehavior.floating,
  ),);
}