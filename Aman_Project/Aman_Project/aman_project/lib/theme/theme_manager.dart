import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeManager with ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;

  ThemeManager({this.themeMode = ThemeMode.light});

  toggleTheme() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    // var theme = preferences.getBool("theme");
    // _themeMode = theme! ? ThemeMode.dark : ThemeMode.light;
    if (themeMode == ThemeMode.dark) {
      themeMode = ThemeMode.light;
      await preferences.setBool("theme", false);
    } else {
      themeMode = ThemeMode.dark;
      await preferences.setBool("theme", true);
    }

    notifyListeners();
  }
}
