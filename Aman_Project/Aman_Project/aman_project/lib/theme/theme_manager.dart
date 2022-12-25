import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeManager with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;

  get themeMode => _themeMode;
  set themeMode(t) => _themeMode;

  toggleTheme() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    // var theme = preferences.getBool("theme");
    // _themeMode = theme! ? ThemeMode.dark : ThemeMode.light;
    if (_themeMode == ThemeMode.dark) {
      print("here");
      _themeMode = ThemeMode.light;
      await preferences.setBool("theme", false);
    } else {
      print("here2");
      _themeMode = ThemeMode.dark;
      await preferences.setBool("theme", true);
    }
    print("theme mode insie:" + _themeMode.toString());
    notifyListeners();
  }
}
