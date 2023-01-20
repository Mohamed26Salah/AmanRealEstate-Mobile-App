import 'package:aman_project/data/numbers_management.dart';
import 'package:aman_project/data/repositories/number_provider.dart';
import 'package:aman_project/data/repositories/user_providers.dart';
import 'package:aman_project/models/number.dart';
import 'package:aman_project/models/user.dart';
import 'package:aman_project/presentation/shared_features/custom_loading_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../constants/globals.dart' as val;
import '../models/chart_data.dart';
import '../presentation/shared_features/custom_message.dart';

class UserHelper {
  static saveUser() async {
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

  Future<DocumentSnapshot> getNewUserData() async {
    final user = FirebaseAuth.instance.currentUser!;
    String id = user.uid;
    return FirebaseFirestore.instance.collection('users').doc(id).get();
  }

  static Future<List<UserModel>> getUsersRolesEmails({String? query}) async {
    List<UserModel> datanum2 = [];
    await FirebaseFirestore.instance
        .collection('users')
        .where("role", isNotEqualTo: "admin")
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        if (query == null) {
          datanum2.add(UserModel(doc["email"], doc["role"]));
        } else {
          if (doc["email"].contains(query) || doc["role"].contains(query)) {
            datanum2.add(UserModel(doc["email"], doc["role"]));
          }
        }
      }
    });
    return datanum2;
  }

  static Future<List<ChartData>> getUsersRoles() async {
    List data = [];
    Map datanum = {};
    List<ChartData> datanum2 = [];

    await FirebaseFirestore.instance
        .collection('users')
        .where("role", isNotEqualTo: "admin")
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

  //Login Page Function (Sign In)
  // bool result = await InternetConnectionChecker().hasConnection;
  Future signIn(
      WidgetRef ref,
      BuildContext context,
      TextEditingController emailController,
      TextEditingController passwordController) async {
    // bool result = await InternetConnectionChecker().hasConnection;
    bool result = true;
    if (result == true) {
      try {
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) {
              return const Center(
                child: LoadingScreen(),
              );
            });

        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );
        if (FirebaseAuth.instance.currentUser!.emailVerified) {
          UserHelper().getNewUserData().then((value) {
            UserModel user = UserModel.fromSnapshot(value);
            ref.read(newUserDataProivder.notifier).state = user;
            // Navigator.of(context).pushReplacementNamed('/home');
            Navigator.of(context)
                .pushNamedAndRemoveUntil('/home', (route) => false);
          });

          NumberManagement.getNumbers().then((value) {
            ref.read(numberProv.notifier).state = value;
          });
        } else {
          Navigator.of(context).pushNamed('/verify');
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          Navigator.of(context).pop();
          errormessage("Error".tr, "No user found for that email.");
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(val.snackBar);
        } else if (e.code == 'wrong-password') {
          Navigator.of(context).pop();
          errormessage("Error".tr, "Wrong password provided for that user.");
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(val.snackBar);
        }
      }
    } else {
      errormessage("Error".tr, "No Internet Connection!");
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(val.snackBar);
    }
  }

  //Register Page
  Future signUp(BuildContext context, TextEditingController emailController,
      TextEditingController passwordController) async {
    bool result = await InternetConnectionChecker().hasConnection;
    if (result == true) {
      try {
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) {
              return const Center(
                child: LoadingScreen(),
              );
            });
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );
        Navigator.of(context).pushNamed('/verify');
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          Navigator.of(context).pop();
          errormessage("Error".tr, "The password provided is too weak.");
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(val.snackBar);
        } else if (e.code == 'email-already-in-use') {
          Navigator.of(context).pop();
          errormessage(
              "Error".tr, "The account already exists for that email.");
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(val.snackBar);
        }
      } catch (e) {
        print(e);
      }
    } else {
      errormessage("Error".tr, "No Internet Connection!");
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(val.snackBar);
    }
  }

  saveUserPref(bool boool) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool("remember", boool);
  }
  //Edit Profile Functions

  changePassword(BuildContext context, String newPassword) async {
    final user = FirebaseAuth.instance.currentUser!;
    try {
      await user.updatePassword(newPassword);
      FirebaseAuth.instance.signOut();
      Navigator.of(context).pushReplacementNamed('/');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.black26,
          content: Text('Password Changed successfully.. Login again please'),
        ),
      );
      // ignore: empty_catches
    } catch (error) {}
  }

  signOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool("remember", false);
    Navigator.of(context).pushReplacementNamed('/login');
  }

  savePref(bool theme) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool("theme", theme);
  }

  saveLangPref(int langNumber) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setInt("langNumber", langNumber);
  }

  static void changeRole(String email, String dropdownvalue) async {
    String path = '';

    await FirebaseFirestore.instance
        .collection('users')
        .where("email", isEqualTo: email)
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        path = (doc.reference.path);
      }
    });

    final washingtonRef = FirebaseFirestore.instance.doc(path);
    washingtonRef.update({"role": dropdownvalue});
  }

  // getPref() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   theme = preferences.getBool("theme")!;
  // }
}
