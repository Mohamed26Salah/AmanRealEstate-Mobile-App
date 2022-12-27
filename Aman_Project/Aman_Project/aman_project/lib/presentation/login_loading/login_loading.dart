import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginLoading extends StatefulWidget {
  const LoginLoading({super.key});

  @override
  State<LoginLoading> createState() => _LoginLoadingState();
}

class _LoginLoadingState extends State<LoginLoading> {
  Future<bool?> getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    bool? value = preferences.getBool("remember");
    await Future.delayed(const Duration(seconds: 1));

    return value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: getPref(),
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data!) {
              FirebaseAuth.instance.idTokenChanges().listen((User? user) {
                if (user != null) {
                  Navigator.of(context).pushReplacementNamed('/home');
                } else {
                  Navigator.of(context).pushReplacementNamed('/login');
                }
              });

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
