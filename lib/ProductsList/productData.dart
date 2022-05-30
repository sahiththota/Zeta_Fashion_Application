import 'package:cloud_firestore/cloud_firestore.dart';

class ProductDataModel{
  String? categoryName;
  String? name;
  String? imageUrl;
  double? price;
  int? quantity;
  String? description;

  ProductDataModel({this.name , this.imageUrl, this.price, this.description, this.categoryName, this.quantity});

  ProductDataModel.fromSnapshot(DocumentSnapshot snapshot){
    Map data = snapshot.data as Map;
    name = data["name"];



  }
}