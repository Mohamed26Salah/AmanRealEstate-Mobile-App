import 'dart:async';

import 'package:aman_project/data/repositories/user_providers.dart';
import 'package:aman_project/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/user_management.dart';

class LoginLoading extends ConsumerStatefulWidget {
  const LoginLoading({super.key});

  @override
  ConsumerState<LoginLoading> createState() => _LoginLoadingState();
}

class _LoginLoadingState extends ConsumerState<LoginLoading> {
  Future<bool?> getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    bool? value = preferences.getBool("remember");
    await Future.delayed(const Duration(seconds: 1));

    if (value!) {
      FirebaseAuth.instance.idTokenChanges().listen((User? user) {
        if (user != null) {
          //Salah Way
          Future userData = UserHelper().getUserData();
          ref.read(userDataProviderRepository.notifier).state = userData;
          //Yasser Way
          // UserHelper().getNewUserData().then((value) {
          //   UserModel user = UserModel.fromSnapshot(value);
          //   ref.read(newUserDataProivder.notifier).state = user;
          //   Navigator.of(context).pushReplacementNamed('/home');
          // });
          Navigator.of(context).pushReplacementNamed('/home');
        } else {
          Navigator.of(context).pushReplacementNamed('/login');
        }
      });

      return value;
    } else {
      Navigator.of(context).pushReplacementNamed('/login');
      return value;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: getPref(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return Center(
                  child: Column(
                children: [
                  Container(
                    width: 300,
                    height: 300,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/images/App_Icon-removebg-preview.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const CircularProgressIndicator(),
                ],
              ));
            }
          }),
    );
  }
}
