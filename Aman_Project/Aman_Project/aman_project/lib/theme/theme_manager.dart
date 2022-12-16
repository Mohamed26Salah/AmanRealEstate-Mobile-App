import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeManager with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;

  get themeMode => _themeMode;

  toggleTheme() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var theme = preferences.getBool("theme");
    _themeMode = theme! ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
