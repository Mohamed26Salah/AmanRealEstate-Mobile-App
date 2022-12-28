import 'package:aman_project/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/chart_data.dart';

class UserHelper {
  static saveUser(User user) async {
    //Dont Put Instance common as it doesnt change when the user logs out
    final FirebaseFirestore db = FirebaseFirestore.instance;
    final user = FirebaseAuth.instance.currentUser!;

    Map<String, dynamic> userData = {
      "email": user.email,
      "role": "user",
    };
    final userRef = db.collection("users").doc(user.uid);
    if ((await userRef.get()).exists) {
      // To Update Anything in the User
    } else {
      await userRef.set(userData);
    }
  }

//Salah Way
  Future<Object> getUserData() async {
    final user = FirebaseAuth.instance.currentUser!;
    String id = user.uid;
    final DocumentSnapshot userDoc =
        await FirebaseFirestore.instance.collection('users').doc(id).get();
    return userDoc;
  }

  //Yasser Way
  Future<DocumentSnapshot> getNewUserData() async {
    final user = FirebaseAuth.instance.currentUser!;
    String id = user.uid;
    return FirebaseFirestore.instance.collection('users').doc(id).get();
  }

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
