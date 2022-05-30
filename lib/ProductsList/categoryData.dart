class categoryModel{
  String? id;
  String? name;
  String? imageUrl;

  categoryModel({this.name , this.imageUrl, this.id});

  factory categoryModel.fromMap(map){
    return categoryModel(
        id: map['id'],
        name : map['name'],
        imageUrl: map['imageUrl'],

    );

  }



  Map<String, dynamic> toMap(){
    return {
      'id' : id,
      'name': name,
      'imageUrl': imageUrl,


    };
  }

}