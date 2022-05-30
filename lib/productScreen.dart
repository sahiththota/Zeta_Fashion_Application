// ignore: file_names
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'checkout_screen.dart';
import 'product_list.dart';

class ProductScreen extends StatefulWidget {
   const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {

  String dropdownvalue = '1';

  int temp = 1;

  // List of items in our dropdown menu
  var items = [
    '1',
    '2',
    '3',
    '4',
    '5',
  ];
  GlobalKey<ScaffoldState> scafoldKey = new GlobalKey<ScaffoldState>();

  final String _content =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum diam ipsum, lobortis quis ultricies non, lacinia at justo.';

  void _shareContent() {
    Share.share(_content);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: scafoldKey,
      backgroundColor: Colors.black,
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          leading: IconButton(
            icon:  const Icon(Icons.arrow_back), onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context) =>  MenFashion()));},
          ),
          automaticallyImplyLeading: false,
          actions: <Widget>[

            IconButton(
              onPressed: () => {},
              icon:  const Icon(
                Icons.favorite_border,
                color: Colors.white,
              ),
            ),

            IconButton(
              onPressed: _shareContent,
              icon:  const Icon(
                Icons.ios_share,
                color: Colors.white,
              ),
            ),
          ]),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10,),

            //  TextField with Location Icon
            //    TextField(
            //     enabled: false,
            //     style:  TextStyle(color: Colors.black, fontSize: 25.0),
            //     decoration: InputDecoration(
            //     border: InputBorder.none,
            //     contentPadding:  EdgeInsets.only(top: 7.0),
            //     prefixIcon: IconButton(
            //       icon:  Icon(  Icons.my_location,),
            //       color: Colors.white, onPressed: () {  },
            //
            //     ),
            //     hintText: "Detecting Location..",
            //     hintStyle:  TextStyle(fontSize: 18.0, color: Colors.grey, fontFamily: "OpenSans",),
            //
            //   ),
            // ),

            Container(
              height: 300,
              width: double.infinity,
              alignment: Alignment.center,
              padding:  const EdgeInsets.all(15),

              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey,
                    image:  const DecorationImage(
                      alignment: Alignment.center,
                      image: AssetImage("assets/men.jpg"),
                      fit: BoxFit.contain,
                    ),
                    boxShadow:  const [
                      BoxShadow(
                        color: Colors.redAccent,
                        offset: Offset(4, 4),
                        blurRadius: 4,
                      ),
                    ]
                ),
              ),
            ),
            const SizedBox(height: 20,),
            const Text("Men's T-Shirt @ PUMA",
              textAlign: TextAlign.justify,
              overflow: TextOverflow. ellipsis,
              maxLines: 2,
              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: Colors.white,),),


            const SizedBox(height: 10,),
            RichText(text:  const TextSpan(
                children: <TextSpan>[
                  TextSpan(text: "\$9.99",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      )),
                  TextSpan(text: " \$12.99",
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                          decoration: TextDecoration.lineThrough
                      ))
                ]
            )),


            //  Button Animated

            const SizedBox(height: 10,),
            Column(
              children: [

                Padding(padding:  const EdgeInsets.all(10),
                  child:Container(
                      height: 100,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:  [
                          const Padding(
                            padding: EdgeInsets.all(10),
                            child: Text("Description :", style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal,color: Colors.white),),
                          ),

                          Padding(
                            padding:  const EdgeInsets.all(10),
                            child: RichText(text:  const TextSpan(
                                children: <TextSpan>[
                                  TextSpan(text: "T-Shirt for men Designed by PUMA Fashions INC @ California",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        wordSpacing: 2,
                                        letterSpacing: 1
                                    ),
                                  ),
                                ]
                            )),
                          )

                        ],
                      )
                  ),),


                Padding(padding:  const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                  child:Row(
                    children: <Widget> [
                      const Text("Quantity",style: TextStyle(fontSize: 18, color: Colors.white),),
                      const SizedBox(width: 10,),
                      Container(
                        padding:  const EdgeInsets.all(10),
                        child:DropdownButton(
                          dropdownColor: Colors.black,
                          style:  const TextStyle(color: Colors.white, fontSize: 15),

                          // Initial Value
                          value: dropdownvalue,
                          // Down Arrow Icon
                          icon:  const Icon(Icons.keyboard_arrow_down),

                          // After selecting the desired option,it will
                          // change button value to selected value
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownvalue = newValue!;
                            });
                            setState(() {
                              print(dropdownvalue);
                            });
                          },
                          // Array list of items
                          items: items.map((String items) {
                            return DropdownMenuItem<String>(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                        ),

                      )],
                  ),),






                const SizedBox(height: 20,),


                Padding(padding:  const EdgeInsets.all(10),
                  child:ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary:  const Color(0xFFEFD47E),
                      elevation: 3,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                      minimumSize:  const Size(double.infinity, 50),
                    ),

                    onPressed: ()  {Navigator.push(context, MaterialPageRoute(builder: (context) =>  const CheckoutScreen()));},
                    child:  const Text(
                      "SUBMIT",
                      style:  TextStyle(
                        color: Colors.black,
                        letterSpacing: 2.0,
                        fontSize: 20,
                      ),
                    ),

                  ),)
              ],
            ),
          ],

        ),

      ),
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
