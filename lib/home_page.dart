
import 'package:carousel_slider/carousel_slider.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:zeta_fashion_application/LoginPage.dart';
import 'package:zeta_fashion_application/product_list.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';

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
  _HomePageStateState createState() => _HomePageStateState();
}

class _HomePageStateState extends State<HomePageState> {

  int activeTab = 0;
  final List<Map> categories = [
    {"name": "Men", "iconPath": "assets/men.jpg",},
    {"name": "Women", "iconPath": "assets/menShirt1.jpg"},
    {"name": "Accessories", "iconPath": "assets/men.jpg"},
    {"name": "Kids", "iconPath": "assets/menShirt1.jpg"},
    {"name": "Women Sport", "iconPath": "assets/men.jpg"},
    {"name": "Men Sport", "iconPath": "assets/menShirt1.jpg"},
  ];


  int _page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();

  int currentIndex = 0;
  final screens= <Widget>[const HomePage(), const ZetaFashion()];

  // ignore: constant_identifier_names
  static const List<Widget> _Items = <Widget>[
    Icon(Icons.home, size: 30,),
    Icon(Icons.favorite, size: 30,),
    Icon(Icons.shopping_cart, size: 30,),
    Icon(Icons.person, size: 30,),
  ];


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

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.black38,

      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
         title: const Text("ZETA", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),),

        // Image.asset(
        //   'assets/zeta.jpg' ,
        //   scale: 8,
        // ),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            onPressed: () => {_showToast(context),},
            icon: const Icon(
              Icons.notifications,
              color: Colors.white,
            ),
          ),

        ],
      ),

      body: SingleChildScrollView(
child: Stack(
         children: <Widget>[


           Column(
            children: [
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
              SingleChildScrollView(
                child: Column(
                  children: const <Widget>[
                    Text(
                      "CATEGORIES",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                color: Colors.black,
                height: 150,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10.0),
                            margin: const EdgeInsets.only(left: 20, top: 15),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50),
                            ),

                            child: InkWell(
                              onTap: () => {
                              Navigator.push(context,
                              MaterialPageRoute(builder: (context) =>   MenFashion()))
                            },
                              child: Image.asset(
                                categories[index]['iconPath'],
                                height: 50,
                                width: 50,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                              padding: const EdgeInsets.fromLTRB(26.0, 0.0, 2.0, 0.0),
                              child: Text(
                                categories[index]['name'],
                                style: const TextStyle(color: Colors.white),
                                textAlign: TextAlign.center,
                              )
                          ),
                        ],
                      );
                    }),
              ),
              const SizedBox(
                height: 8,
              ),
              CarouselSlider(
                options: CarouselOptions(
                  height: 200,
                  aspectRatio: 2.0,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: true,
                  initialPage: 1,
                  autoPlay: true,
                ),
                items: imageSliders,
              ),
            ],
          ),
        ],
        ),
      ),


      bottomNavigationBar: CurvedNavigationBar(
        height: 50,
          key: _bottomNavigationKey,
        index: currentIndex,
        items : _Items,
          buttonBackgroundColor: Colors.red,
          backgroundColor: Colors.white,
            onTap: (index) {
              setState(() {
              _page = index;
          });
        },
      ),



      // body: HomePageState(),


    );

  }
}

void _showToast(BuildContext context) {

  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(

    content: Text("Notifications enabled",
    style: TextStyle(fontSize: 20, color: Colors.black),
      textAlign: TextAlign.center,
    ),
  backgroundColor: Colors.white,
    duration: Duration(seconds: 3),
    shape: StadiumBorder(),
    behavior: SnackBarBehavior.floating,
  ));
  //
  // final scaffold = ScaffoldMessenger.of(context);
  // scaffold.showSnackBar(
  //
  //   SnackBar(
  //     backgroundColor: Colors.transparent,
  //     content: const Text('Notifications enabled' ,style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: Colors.white),),
  //   ),
  // );
}
