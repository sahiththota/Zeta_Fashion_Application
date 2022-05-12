import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:zeta_fashion_application/LoginPage.dart';



class AdminPage extends StatelessWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        children: [

          Image.asset("assets/loader.gif", height: 200, width: 500,),
          const Text("ZETA FASHION", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
        ],
      ),
      nextScreen: const AdminScreenState(),
      splashIconSize: 250,
      duration: 4000,
      splashTransition: SplashTransition.fadeTransition,
      backgroundColor: Colors.black,
      // pageTransitionType: PageTransitionType.bottomToTop,
      animationDuration: const Duration(seconds: 1),);
  }
}
class AdminScreenState extends StatefulWidget {
  const AdminScreenState({Key? key}) : super(key: key);

  @override
  _AdminScreenState createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreenState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Admin Screen" , style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: () => {Navigator.push(context, MaterialPageRoute(builder: (context) => ZetaFashion()))},
            icon: const Icon(
              Icons.login_outlined,
              color: Colors.white,
            ),
          ),

        ],
      ),
      drawer: Drawer(

      ),


      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                child:ElevatedButton(
                    onPressed: (){},
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFEFD47E),
                      elevation: 3,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),),
                      minimumSize: Size(200, 70),
                    ),
                    child: Text("Add Products", style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w600),)),
              ),
              Center(
                child:ElevatedButton(
                    onPressed: (){},
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFEFD47E),
                      elevation: 3,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                      minimumSize: Size(200, 70),
                    ),
                    child: Text("Edit Products", style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w600),)),
              ),
              Center(
                child:ElevatedButton(
                    onPressed: (){},
                    style: ElevatedButton.styleFrom(
                  primary: Color(0xFFEFD47E),
                  elevation: 3,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                  minimumSize: Size(200, 70),
                ),child: Text("Remove Products", style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w600),)),
              )
            ],
          )
        ],
      ),
    );
  }
}
