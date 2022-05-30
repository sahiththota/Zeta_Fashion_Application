import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:zeta_fashion_application/LoginPage.dart';
import 'package:zeta_fashion_application/checkout_screen.dart';
import 'package:zeta_fashion_application/product_list.dart';
import 'package:page_transition/page_transition.dart';
import 'UserModel/usermodel.dart';
import 'package:zeta_fashion_application/store_locator.dart';


final List<String> imgList = [
  "https://www.shopickr.com/wp-content/uploads/2016/04/snapdeal-mens-fashion-sale-2016.jpg",
  "https://www.shopickr.com/wp-content/uploads/2016/04/snapdeal-mens-fashion-sale-2016.jpg",
  "https://i.pinimg.com/564x/0f/ff/58/0fff58b310e24a45bfd8346f2283ede7.jpg",
  "https://i.pinimg.com/564x/0f/ff/58/0fff58b310e24a45bfd8346f2283ede7.jpg",
];

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePageState(),
    );
  }
}

class HomePageState extends StatefulWidget {
  const HomePageState({Key? key}) : super(key: key);

  @override
  State<HomePageState> createState() => _HomePageStateState();
}

class _HomePageStateState extends State<HomePageState> {
  // final List<Map> categories = [
  //   {"name": "Men", "iconPath": "assets/men.jpg", "value" : "Men"},
  //   {"name": "Women", "iconPath": "assets/menShirt1.jpg","value" : "Women"},
  //   {"name": "Accessories", "iconPath": "assets/men.jpg","value" : "Accessories"},
  //   {"name": "Kids", "iconPath": "assets/menShirt1.jpg","value" : "Kids"},
  //   {"name": "Women Sport", "iconPath": "assets/men.jpg","value" : "WomenS"},
  //   {"name": "Men Sport", "iconPath": "assets/menShirt1.jpg","value" : "MenS"},
  // ];

  final List<Widget> imageSliders = imgList
      .map((item) => Container(
    margin: const EdgeInsets.all(5.0),
    child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
        child: Stack(
          children: <Widget>[
            Image.network(item, fit: BoxFit.fill, width: 1000.0),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(200, 0, 0, 0),
                      Color.fromARGB(0, 0, 0, 0)
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 20.0),
              ),
            ),
          ],
        )),
  ))
      .toList();

  FirebaseAuth _auth = FirebaseAuth.instance;

  final Stream<QuerySnapshot> category =
  FirebaseFirestore.instance.collection("category").snapshots();

  signOut() async{
    await _auth.signOut();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          "ZETA",
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.pin_drop_rounded,
            color: Colors.white,
          ), onPressed: () {
            Navigator.push(context,MaterialPageRoute(builder: (context) => StoreLocator()));
        },

        ),
        automaticallyImplyLeading: false,
        actions: <Widget>[


          IconButton(
            onPressed: () => {
              _showToast(context),
            },
            icon: const Icon(
              Icons.notifications,
              color: Colors.white,
            ),
          ),

          IconButton(
            onPressed: () => {
              Navigator.push(
                  context,
                 MaterialPageRoute(builder: (context) => CheckoutScreen()))
            },
            icon: const Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
          ),

          IconButton(
            onPressed: () => {
              signOut(),
              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginState()))
            },
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
          ),
        ],
      ),

      // body: ,
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          Container(
            padding: const EdgeInsets.all(25),
            child: Flexible(
              flex: 1,
              child: TextField(
                cursorColor: Colors.grey,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                  hintText: "Search products",
                  hintStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          CarouselSlider(
            options: CarouselOptions(
              aspectRatio: 2.0,
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
              initialPage: 0,
              autoPlay: true,
            ),
            items: imageSliders,
          ),
          const SizedBox(
            height: 2,
          ),
          const Text(
            "CATEGORIES",
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            color: Colors.black,
            height: 150,
            child: StreamBuilder<QuerySnapshot>(
              stream: category,
              builder: (
                  BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshots,
                  ) {
                if (snapshots.hasError) {
                  return const Text("Snapshots error");
                } else if (snapshots.connectionState ==
                    ConnectionState.waiting) {
                  return const Text("Data Loading");
                }

                final data = snapshots.requireData;

                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: data.size,
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductListState(
                                  categoryId: data.docs[index].id,
                                  categoryName:data.docs[index]["name"]),
                            ),
                          )
                        },
                        child: Column(
                          children: [
                            Expanded(
                              child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 40),
                                  margin: const EdgeInsets.only(
                                      left: 5, top: 25, bottom: 15, right: 20),
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(50),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            data.docs[index]["imageUrl"],
                                            scale: 2),
                                        fit: BoxFit.cover,
                                      ))),
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Text(
                              data.docs[index]["name"].toUpperCase(),
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            )
                          ],
                        ));
                  },
                );
              },
            ),
            // const SizedBox(height: 10),
            // Container(
            //
            //     child: Text(
            //       getData[index]['name'],
            //       style: const TextStyle(color: Colors.white),
            //       textAlign: TextAlign.center,
            //     )
            // ),
          ),
          const SizedBox(height: 50),
          CarouselSlider(
            options: CarouselOptions(
              aspectRatio: 2.0,
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
              initialPage: 0,
              autoPlay: true,
            ),
            items: imageSliders,
          ),
        ]),
      ),
    );
  }
}

class FireStorageService extends ChangeNotifier {
  FireStorageService();
  static Future<dynamic> loadImage(
      BuildContext context, String imageUrl) async {
    return await FirebaseStorage.instance
        .ref()
        .child("category")
        .getDownloadURL();
  }
}

void _showToast(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    content: Text(
      "Notifications enabled",
      style: TextStyle(fontSize: 20, color: Colors.black),
      textAlign: TextAlign.center,
    ),
    backgroundColor: Colors.white,
    duration: Duration(seconds: 3),
    shape: StadiumBorder(),
    behavior: SnackBarBehavior.floating,
  ));
}
