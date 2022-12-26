import 'package:cloud_firestore/cloud_firestore.dart';

class UserData {
  UserData(this.email, this.role);

  final String email;

  final String role;
  int compareTo(UserData other) => email.compareTo(other.email);
}

Future<List<UserData>> getData2() async {
  List<UserData> datanum2 = [];

  await FirebaseFirestore.instance
      .collection('users')
      .limit(100)
      .get()
      .then((QuerySnapshot querySnapshot) {
    for (var doc in querySnapshot.docs) {
      datanum2.add(UserData(doc["email"], doc["role"]));
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
