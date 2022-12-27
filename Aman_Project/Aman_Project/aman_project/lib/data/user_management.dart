import 'package:aman_project/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/chart_data.dart';

class UserHelper {
  static final FirebaseFirestore _db = FirebaseFirestore.instance;
  static final user = FirebaseAuth.instance.currentUser!;
  String uid = user.uid;
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

  Future<Object> getUserData() async {
    final DocumentSnapshot userDoc =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();
    return userDoc;
  }

  // Future<String> getUserEmail() async {
  //   // final user = FirebaseAuth.instance.currentUser!;
  //   // String uid = user.uid;
  //   String userEmail;
  //   final DocumentSnapshot userDoc =
  //       await FirebaseFirestore.instance.collection('users').doc(uid).get();
  //   userEmail = userDoc.get('email');
  //   return userEmail;
  // }

  // Future<String> getUserRole() async {
  //   // final user = FirebaseAuth.instance.currentUser!;
  //   // String uid = user.uid;
  //   String userRole;
  //   final DocumentSnapshot userDoc =
  //       await FirebaseFirestore.instance.collection('users').doc(uid).get();
  //   userRole = userDoc.get('role');
  //   return userRole;
  // }
  static Future<List<UserModel>> getData2User() async {
    List<UserModel> datanum2 = [];

    await FirebaseFirestore.instance
        .collection('users')
        .limit(100)
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        datanum2.add(UserModel(doc["email"], doc["role"]));
      }
    });
    // await FirebaseFirestore.instance
    //     .collection('properties')
    //     .get()
    //     .then((QuerySnapshot querySnapshot) {
    //   for (var doc in querySnapshot.docs) {
    //     data!.add(doc["Type"]);

    //   }
    // });
    return datanum2;
  }

  static Future<List<ChartData>> getData2() async {
    List data = [];
    Map datanum = {};
    List<ChartData> datanum2 = [];

    await FirebaseFirestore.instance
        .collection('users')
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        data.add(doc["role"]);
      }
    });

    for (var e in data) {
      datanum.containsKey(e) ? datanum[e]++ : datanum[e] = 1;
    }
    datanum.forEach((k, v) => datanum2.add(ChartData(k, v)));

    return datanum2;
  }
}
