import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:zeta_fashion_application/LoginPage.dart';
import 'package:zeta_fashion_application/UserModel/usermodel.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SignUppage(),
    );
  }
}

class SignUppage extends StatefulWidget {
  const SignUppage({Key? key}) : super(key: key);

  @override
  _SignUppageState createState() => _SignUppageState();
}

class _SignUppageState extends State<SignUppage> {


  final _formKey = GlobalKey<FormState>();

  final nameC = TextEditingController();
  final phoneC = TextEditingController();
  final emailC = TextEditingController();
  final passwordC = TextEditingController();

  final controller = TextEditingController();


  String? get pwdValidator {
    final text = controller.value.text;
    if (text.length < 6) {
      return 'Password must be longer than 6 characters';
    } else {
      return null;
    }
  }

  final _auth = FirebaseAuth.instance;
  // final databaseReference = Firebase.instance.ref();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Sign Up", style: TextStyle(
            fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ), onPressed: () =>
        {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ZetaFashion()))
        },

        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
              children: [
                TextFormField(
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                          // width: 0.0 produces a thin "hairline" border
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        labelText: "Full Name",
                        labelStyle: const TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ))
                ),
                const SizedBox(height: 30,),


                TextFormField(
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                          // width: 0.0 produces a thin "hairline" border
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        labelText: "Contact Information",
                        labelStyle: const TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ))
                ),
                const SizedBox(height: 30,),

                TextFormField(
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                          // width: 0.0 produces a thin "hairline" border
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        labelText: "Email Id",
                        labelStyle: const TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ))
                ),
                const SizedBox(height: 30,),

                TextFormField(
                    style: const TextStyle(color: Colors.white),
                    obscureText: true,
                    decoration: InputDecoration(
                        errorText: pwdValidator,
                        errorStyle: const TextStyle(color: Colors.white),
                        enabledBorder: const OutlineInputBorder(
                          // width: 0.0 produces a thin "hairline" border
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        labelText: "Password",
                        labelStyle: const TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ))
                ),
                const SizedBox(height: 50,),


                ElevatedButton(
                  onPressed: () {
                    if (nameC.text != "" && phoneC.text != "" &&
                        emailC.text != "" && passwordC.text != "") {
                      Insertdata(
                          nameC.text, phoneC.text, emailC.text, passwordC.text);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginState()));
                    }
                    else{
                      // ignore: avoid_print
                      print("No data entered");
                    }

                  },
                  style: ElevatedButton.styleFrom(primary: const Color(0xFFEFD47E)),
                  // color: Color(0xFFEFD47E),
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
                      color: Colors.black,
                      letterSpacing: 1.0,
                      fontSize: 20,

                    ),
                  ),
                ),

              ]),

        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Future<void> Insertdata(String name, String phoneNumber, String email,
      String password,) async {
    // String? key = databaseReference.child(phoneNumber).child("ListRegister").push().key;
    // databaseReference.child("Users").child(phoneNumber).child(key!).set({
    //   "Full Name": name,
    //   "Contact Information": phoneNumber,
    //   "Email": Email,
    //   "Password": password,
    // });
    // nameC.clear();
    // phoneC.clear();
    // emailC.clear();
    // passwordC.clear();




    if(_formKey.currentState!.validate() ){
      await _auth.createUserWithEmailAndPassword(email: email, password: password).then((value) =>
      {
        postDetailstoFirestore()
      }).catchError((e){
          _showToast(context);
      });
    }
  }



  postDetailstoFirestore() async{
    FirebaseDatabase firebaseFireStore = FirebaseDatabase.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();


    userModel.fullName = nameC.text;
    userModel.email = user!.email;
    userModel.contactInfo = phoneC.text;
    userModel.uid = user.uid;



  }





  void _showToast(BuildContext context, {msg}) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(

      content: Text("Enter the required information",
        style: TextStyle(fontSize: 20, color: Colors.black),
        textAlign: TextAlign.center,
      ),
      backgroundColor: Colors.white,
      duration: Duration(seconds: 3),
      shape: StadiumBorder(),
      behavior: SnackBarBehavior.floating,
    ));
  }
}


