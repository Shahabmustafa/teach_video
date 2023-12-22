import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel{
  String name;
  String profilePhoto;
  String email;
  String id;

  UserModel({
    required this.name,
    required this.email,
    required this.id,
    required this.profilePhoto,
});

  Map<String,dynamic> toJson() => {
      "name" : name,
      "email" : email,
      "id" : id,
      "profilePhoto" : profilePhoto,
  };

  static UserModel fromSnap(DocumentSnapshot snap){
    var snapshot = snap.data() as Map<String,dynamic>;
    return UserModel(
      id: snapshot["id"],
      name: snapshot["name"],
      email: snapshot["email"],
      profilePhoto: snapshot["profilePhoto"],
    );
  }
}
