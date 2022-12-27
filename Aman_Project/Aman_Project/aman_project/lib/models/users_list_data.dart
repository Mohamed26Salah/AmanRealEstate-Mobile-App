import 'package:cloud_firestore/cloud_firestore.dart';

import 'user.dart';

Future<List<User>> getData2() async {
  List<User> datanum2 = [];

  await FirebaseFirestore.instance
      .collection('users')
      .limit(100)
      .get()
      .then((QuerySnapshot querySnapshot) {
    for (var doc in querySnapshot.docs) {
      datanum2.add(User(doc["email"], doc["role"]));
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
