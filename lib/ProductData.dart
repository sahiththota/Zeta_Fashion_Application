class Products {
  String? id;
  String? name;
  String? price;
  String? image;
  String? category;
  String? categoryImage;

  Products.fromMap(Map<String, dynamic> data) {
    id = data["id"];
    name = data["name"];
    price = data["price"];
    image = data["image"];
  }
}
