import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_place/google_place.dart';
import 'package:zeta_fashion_application/ProductData.dart';

class EditProductScreen extends StatefulWidget {
  const EditProductScreen({Key? key}) : super(key: key);

  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final TextEditingController stockController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        automaticallyImplyLeading: true,
      ),
      body: Container(
        color: Colors.black,
        child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('productList')
                .snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return const CircularProgressIndicator();
              }
              List<Products> products = [];
              List<TextEditingController> controllers = [];
              for (QueryDocumentSnapshot element in snapshot.data!.docs) {
                Products product =
                Products.fromJson(element.data() as Map<String, dynamic>);
                products.add(product);
                controllers.add(
                    TextEditingController(text: product.quantity.toString()));
              }
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.all(20),
                      // height: 100,
                      width: double.infinity,
                      child: Row(mainAxisSize: MainAxisSize.min, children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: SizedBox(
                            height: 150,
                            width: 150,
                            child: Image.network(
                              products[index].imageUrl ?? '',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                products[index].name ?? '',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                                maxLines: 2,
                              ),
                              Container(
                                width: 100,
                                child: TextField(
                                  controller: controllers[index],
                                  autofocus: false,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  style: const TextStyle(
                                      fontSize: 18, color: Colors.white),
                                  decoration: InputDecoration(
                                      isDense: true,
                                      // contentPadding: EdgeInsets.fromLTRB(
                                      //     10.0, 5.0, 5.0, 10.0),
                                      hintText: 'Enter Available Stock',
                                      hintStyle: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15,
                                          color: Colors.white),
                                      filled: true,
                                      fillColor: Colors.transparent,
                                      border: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(20))),
                                ),
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    FirebaseFirestore.instance
                                        .collection('productList')
                                        .doc(snapshot.data!.docs[index].id)
                                        .update({
                                      'quantity':
                                      int.parse(controllers[index].text)
                                    });
                                  },
                                  child: Text('Update'))
                            ],
                          ),
                        ),
                      ]),
                    );
                  });
            }),
      ),
    );
  }
}
