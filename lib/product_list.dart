import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:zeta_fashion_application/home_page.dart';
import 'ProductData.dart';
import 'productScreen.dart';

class ProductListState extends StatefulWidget {
  final String? categoryId;
  final String? categoryName;
  const ProductListState({this.categoryId, this.categoryName, Key? key})
      : super(key: key);

  @override
  State<ProductListState> createState() => _ProductListStateState();
}

class _ProductListStateState extends State<ProductListState> {
  Icon customIcon = const Icon(Icons.search);
  Widget customSearchBar = const Text("Mens Fashion");

  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  // String collection = "categoryName";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('${widget.categoryName!.toUpperCase()} Fashion'),
        automaticallyImplyLeading: true,
        centerTitle: true,
        // leading: IconButton(
        //   icon: Icon(
        //     Icons.arrow_back,
        //   ),
        //   onPressed: () => {
        //     Navigator.push(
        //         context, MaterialPageRoute(builder: (context) => HomePage()))
        //   },
        // ),
        actions: <Widget>[
          IconButton(
            onPressed: () => {
              setState(() {
                if (customIcon.icon == Icons.search) {
                  customIcon = const Icon(Icons.cancel);
                  customSearchBar = const TextField(
                    textInputAction: TextInputAction.go,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search Products",
                        hintStyle: TextStyle(color: Colors.white)),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  );
                } else {
                  customIcon = const Icon(Icons.search);
                  customSearchBar = const Text("Mens Fashions");
                }
              })
            },
            icon: customIcon,
          ),
          IconButton(
            onPressed: () => {},
            icon: const Icon(
              Icons.filter_alt_outlined,
              size: 25,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        // child: GridView.builder(
        //     gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        //         maxCrossAxisExtent: 300,
        //         crossAxisSpacing: 20,
        //         mainAxisSpacing: 20),
        //     itemBuilder: (BuildContext context, index) {
        //       return
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.grey, borderRadius: BorderRadius.circular(15)),
          child: Card(
            color: Colors.black,
            elevation: 0.2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: StreamBuilder(
                stream: _firebaseFirestore
                    .collection("productList")
                    .where('categoryId', isEqualTo: widget.categoryId)
                    .snapshots(),
                builder: (
                    BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot,
                    ) {
                  if (snapshot.hasError) {
                    return const Text("Snapshots error");
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return const Text("Data Loading");
                  }

                  final data = snapshot.requireData;
                  List<Products> products = [];
                  for (QueryDocumentSnapshot element in data.docs) {
                    products.add(Products.fromJson(
                        element.data() as Map<String, dynamic>));
                  }
                  print(jsonEncode(
                      data.docs.first.data() as Map<String, dynamic>));
                  return ListView.builder(
                      itemCount: data.size,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, index) {
                        // children: snapshot.data!.docs.map((doc){
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: InkWell(
                                onTap: () => {
                                  if (data.docs[index]['quantity'] > 0)
                                    {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ProductScreen(
                                                    product: products[index],
                                                  )))
                                    }
                                },
                                child: GridView(
                                    physics: const ClampingScrollPhysics(),
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        childAspectRatio: 2 / 3,
                                        crossAxisCount: 1,
                                        crossAxisSpacing: 8,
                                        mainAxisSpacing: 8,
                                        mainAxisExtent: 240),
                                    children: [
                                      Card(
                                        semanticContainer: true,
                                        color: Colors.lightBlueAccent,
                                        elevation: 0.2,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(8.0),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(5),
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            children: [
                                              SizedBox(height: 10,),
                                              Image.network(
                                                data.docs[index]['imageUrl'],
                                                fit: BoxFit.contain,
                                                height: 150,
                                                width: double.infinity,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(
                                                    vertical: 10,
                                                    horizontal: 25),
                                                child: Text(
                                                  data.docs[index]['name'],
                                                  textAlign: TextAlign.center,
                                                  maxLines: 4,
                                                  style: const TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                      FontWeight.w500,
                                                      color: Colors.black),
                                                ),
                                              ),
                                              if (data.docs[index]
                                              ['quantity'] ==
                                                  0)
                                                const Text(
                                                  'Out Of Stock',
                                                  style: TextStyle(
                                                      color: Colors.redAccent,
                                                      fontSize: 16),
                                                )
                                            ],
                                          ),
                                        ),
                                      )
                                    ]),
                              ),
                            )
                          ],
                        );
                      });
                }),
          ),
        ),
      ),
    );
  }
}
