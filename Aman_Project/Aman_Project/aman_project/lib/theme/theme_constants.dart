import 'package:flutter/material.dart';

const colorPrimary = Color(0xFFCD9933);
const colorSecondary = Color(0xFFe0e0e0);
const colorError = Color.fromARGB(201, 212, 0, 0);
const colorFocus = Color.fromARGB(255, 0, 166, 255);
const colorSplash = Color.fromARGB(255, 51, 205, 151);

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: colorPrimary,
  splashColor: colorSplash,
  errorColor: colorError,
  focusColor: colorFocus,
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: colorPrimary,
  errorColor: colorError,
  focusColor: colorFocus,
);
