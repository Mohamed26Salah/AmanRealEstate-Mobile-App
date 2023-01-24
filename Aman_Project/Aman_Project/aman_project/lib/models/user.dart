// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String email;
  String role;
  UserModel(this.email, this.role);
  UserModel.alternate({this.email = '', this.role = ''});
  int compareTo(UserModel other) => email.compareTo(other.email);

  factory UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    return UserModel(snapshot.get('email'), snapshot.get('role'));
  }
}
