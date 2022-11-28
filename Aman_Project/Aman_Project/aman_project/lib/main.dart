import 'package:get/get.dart';
import 'widgets/local_strings.dart';
import 'package:aman_project/firebase_options.dart';
import 'package:aman_project/widgets/AddForm.dart';
import 'package:aman_project/widgets/email_verification.dart';
import 'package:aman_project/widgets/forget_password.dart';
import './widgets/Register_page.dart';
import './widgets/navBar.dart';
import 'package:aman_project/theme/theme_constants.dart';
import 'package:aman_project/theme/theme_manager.dart';
import 'package:aman_project/widgets/edit_profile.dart';
import 'package:aman_project/widgets/property_description.dart';
import 'package:aman_project/widgets/rent_Type.dart';
import 'package:aman_project/widgets/search.dart';
import 'package:firebase_core/firebase_core.dart';
import './widgets/login_page.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

ThemeManager _themeManager = ThemeManager();

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
        '/': (context) => const LoginPage(),
        '/register': (context) => RegisterPage(),
        '/home': (context) => NavBar(themeManager: _themeManager),
        '/details': (context) => const Details(),
        '/addForm': (context) => AddForm(),
        '/rents': (context) => RentType(),
        '/search': (context) => const Search(),
        '/forget': (context) => const ForgetPassword(),
        '/verify': (context) => const EmailVerification(),
      },
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: _themeManager.themeMode,

      // home: Search(),
    );
  }
}
