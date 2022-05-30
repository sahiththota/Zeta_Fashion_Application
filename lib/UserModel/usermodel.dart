class UserModel {
  String? uid;
  String? email;
  String? contactInfo;
  String? password;
  String? fullName;

  UserModel(
      {this.uid, this.email, this.contactInfo, this.fullName, this.password});

  factory UserModel.fromMap(map) {
    return UserModel(
        uid: map['uid'],
        email: map['email'],
        contactInfo: map['contactInfo'],
        fullName: map['full_name'],
        password: map['password']);
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      "password": password,
      "contactInfo": contactInfo,
      "full_name": fullName,
    };
  }
}
