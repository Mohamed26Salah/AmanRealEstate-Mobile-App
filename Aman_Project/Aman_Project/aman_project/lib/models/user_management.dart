import 'package:firebase_auth/firebase_auth.dart';
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

  Future<String> getUserEmail() async {
    final user = FirebaseAuth.instance.currentUser!;
    String uid = user.uid;
    String userEmail;
    final DocumentSnapshot userDoc =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();
    userEmail = userDoc.get('email');
    return userEmail;
  }

  Future<String> getUserRole() async {
    final user = FirebaseAuth.instance.currentUser!;
    String uid = user.uid;
    String userRole;
    final DocumentSnapshot userDoc =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();
    userRole = userDoc.get('role');
    return userRole;
  }
}
