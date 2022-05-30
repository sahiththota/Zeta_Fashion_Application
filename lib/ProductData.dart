
// class Products{
//   String? id;
//   String? name;
//   String? price;
//   String? image;
//   String? category;
//   String? categoryImage;


//   Products.fromMap(Map<String , dynamic> data ){
//     id = data["id"];
//     name = data["name"];
//     price = data["price"];
//     image = data["image"];


//   }


// }

class Products {
  String? price;
  String? imageUrl;
  String? name;
  String? description;
  String? categoryName;
  String? categoryId;
  int? quantity;

  Products(
      {this.price,
        this.imageUrl,
        this.name,
        this.description,
        this.categoryName,
        this.quantity=0,
        this.categoryId});

  Products.fromJson(Map<String, dynamic> json) {
    price = json['price'];
    imageUrl = json['imageUrl'];
    name = json['name'];
    description = json['description'];
    categoryName = json['categoryName'];
    categoryId = json['categoryId'];
    quantity=json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['price'] = price;
    data['imageUrl'] = imageUrl;
    data['name'] = name;
    data['description'] = description;
    data['categoryName'] = categoryName;
    data['categoryId'] = categoryId;
    data['quantity']= quantity;
    return data;
  }
}


