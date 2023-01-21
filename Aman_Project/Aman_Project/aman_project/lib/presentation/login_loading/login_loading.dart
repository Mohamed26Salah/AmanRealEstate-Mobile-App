import 'dart:async';
import 'package:aman_project/data/numbers_management.dart';
import 'package:aman_project/data/repositories/number_provider.dart';
import 'package:aman_project/data/repositories/user_providers.dart';
import 'package:aman_project/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../data/user_management.dart';
import '../shared_features/custom_loading_screen.dart';

class LoginLoading extends ConsumerStatefulWidget {
  const LoginLoading({super.key});

  @override
  ConsumerState<LoginLoading> createState() => _LoginLoadingState();
}

class _LoginLoadingState extends ConsumerState<LoginLoading> {
  updateLanguage(Locale locale) {
    Get.back();
    Get.updateLocale(locale);
  }

  Future<bool?> getPrefs(BuildContext cont) async {
    if (mounted) {
      List locale = [
        {'name': 'ENGLISH', 'locale': const Locale('en', 'US')},
        {'name': 'العربيه', 'locale': const Locale('ar', 'EG')},
      ];
      var toBeUsedLocale = locale[0]['locale'];

      SharedPreferences preferences = await SharedPreferences.getInstance();
      bool value = false;
      int value2 = 0;
      value = preferences.getBool("remember") ?? false;
      value2 = preferences.getInt("langNumber") ?? 0;

      await Future.delayed(const Duration(seconds: 1));
      if (value2 == 0) {
        toBeUsedLocale = locale[0]['locale'];
      } else {
        toBeUsedLocale = locale[1]['locale'];
      }

      if (value) {
        FirebaseAuth.instance.idTokenChanges().listen((User? user) {
          if (user != null) {
            UserHelper().getNewUserData().then((value) {
              UserModel user = UserModel.fromSnapshot(value);
              if (mounted) {
                ref.read(newUserDataProivder.notifier).state = user;
                Navigator.of(context).pushReplacementNamed('/home');
                updateLanguage(toBeUsedLocale);
              }
            });
            if (mounted) {
              NumberManagement.getNumbers().then((value) {
                ref.read(numberProv.notifier).state = value;
              });
            }
          } else {
            Navigator.of(context).pushReplacementNamed('/login');
            updateLanguage(toBeUsedLocale);
          }
        });

        return value;
      } else {
        if (!mounted) return false;
        Navigator.of(context).pushReplacementNamed('/login');
        updateLanguage(toBeUsedLocale);

        return false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: getPrefs(context),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return const Center(
                child: LoadingScreen(),
              );
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
                  const Center(
                    child: LoadingScreen(),
                  ),
                ],
              ));
            }
          }),
    );
  }
}
