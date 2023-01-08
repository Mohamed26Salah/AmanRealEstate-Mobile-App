import 'package:aman_project/presentation/login_loading/login_loading.dart';
import 'package:aman_project/presentation/properties/edit_property.dart';
import 'package:aman_project/presentation/rents/add_form_rent.dart';
import 'package:aman_project/presentation/rents/main_page_rents.dart';
import 'package:aman_project/presentation/rents/rent_description.dart';
import 'package:get/get.dart';
import 'presentation/shared_features/local_strings.dart';
import 'package:aman_project/firebase_options/firebase_options.dart';
import 'package:aman_project/presentation/properties/add_form.dart';
import 'package:aman_project/presentation/login_register/email_verification.dart';
import 'package:aman_project/presentation/login_register/forget_password.dart';
import 'presentation/login_register/Register_page.dart';
import 'presentation/navigation/navBar.dart';
import 'package:aman_project/theme/theme_constants.dart';
import 'package:aman_project/theme/theme_manager.dart';
import 'package:aman_project/presentation/properties/property_description.dart';
import 'package:aman_project/presentation/properties/main_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'presentation/login_register/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool? theme = false;
ThemeManager _themeManager = ThemeManager();
getPref() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  theme = preferences.getBool("theme") ?? false;
  if (theme!) {
    _themeManager = ThemeManager(themeMode: ThemeMode.dark);
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await getPref();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void dispose() {
    _themeManager.removeListener(themeListener);
    super.dispose();
  }

  @override
  void initState() {
    _themeManager.addListener(themeListener);

    super.initState();
  }

  themeListener() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: LocaleString(),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginLoading(),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/home': (context) => NavBar(themeManager: _themeManager),
        '/details': (context) => const Details(),
        '/addForm': (context) => AddForm(),
        '/editProperty': (context) => EditProperty(),
        // '/rents': (context) => RentType(),
        '/search': (context) => const Search(),
        '/forget': (context) => const ForgetPassword(),
        '/verify': (context) => const EmailVerification(),
        '/addFormRent': (context) => const AddFormRent(),
        '/MainPageRent': (context) => const MainPageRent(),
        '/rentDetails': (context) => const RentsDescription(),
        '/editRents': (context) => const RentsDescription(),
      },
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: _themeManager.themeMode,
      // home: Search(),
    );
  }
}
