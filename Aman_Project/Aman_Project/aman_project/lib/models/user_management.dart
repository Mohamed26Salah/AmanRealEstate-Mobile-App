import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:aman_project/firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserHelper {
  static final FirebaseFirestore _db = FirebaseFirestore.instance;

  static saveUser(User user) async {
    Map<String, dynamic> userData = {
      "email": user.email,
      "role": "user",
    };
    final userRef = _db.collection("users").doc(user.uid);
    if ((await userRef.get()).exists) {
      // To Update Anything in the User
    } else {
      await userRef.set(userData);
    }
  }
}
