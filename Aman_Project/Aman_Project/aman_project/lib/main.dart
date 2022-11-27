import 'package:get/get.dart';
import 'widgets/local_strings.dart';
import 'package:aman_project/data/data.dart';
import 'package:aman_project/data/rent_data.dart';
import 'package:aman_project/firebase_options.dart';
import 'package:aman_project/widgets/AddForm.dart';
import './widgets/Register_page.dart';
import './widgets/navBar.dart';
import 'package:aman_project/widgets/edit_profile.dart';

import 'package:aman_project/widgets/property_description.dart';
import 'package:aman_project/widgets/rent_Type.dart';
import 'package:aman_project/widgets/search.dart';
import 'package:aman_project/widgets/wish_list.dart';
import 'package:firebase_core/firebase_core.dart';
import './widgets/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'widgets/local_strings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: LocaleString(),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/register': (context) => RegisterPage(),
        '/home': (context) => const NavBar(),
        '/details': (context) => const Details(),
        '/addForm': (context) => AddForm(),
        '/rents': (context) => RentType(),
        '/search': (context) => const Search(),
      },

      // home: Search(),
    );
  }
}
