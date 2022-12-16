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
  // Future<String> getUser() async {
  //   // List? itemsList;
  //   // String? data;
  //   // String? data2;

  //   final user = FirebaseAuth.instance.currentUser!;
  //   String uid = user.uid;
  //   String userEmail;
  //   String userRole;
  //   String userList;

  //   final DocumentSnapshot userDoc =
  //       await FirebaseFirestore.instance.collection('users').doc(uid).get();
  //   userEmail = userDoc.get('email');
  //   userRole = userDoc.get('role');

  //   userList = userEmail;
  //   // userList.add(userRole);
  //   return userList;
  //   //  try {
  //   //   await _db.collection('users') .where('email', isEqualTo: user.email).get().then((QuerySnapshot querysnapshot) => {
  //   //      data = querysnapshot.docs.first['email'],
  //   //      data2 = querysnapshot.docs.first['role'],
  //   //   });
  //   //   itemsList!.add(data);
  //   //   itemsList.add(data2);
  //   //   return itemsList;
  //   //  } catch(e) {
  //   //   print(e.toString());
  //   //   return itemsList!;
  //   //  }
  // }

}

// final productsListFutureProvider =
//     FutureProvider.autoDispose<List<Product>>((ref) {
//   final productsRepository = ref.watch(productsRepositoryProvider);
//   return productsRepository.fetchProductsList();
// });

// final userEmailProvider = FutureProvider((ref) async {
//   return await UserHelper().getUser();
// });

// final userRoleProvider = FutureProvider((ref) async {
//   return await UserHelper().getUser();
// });
