import 'package:flutter/material.dart';

const colorPrimary = Color(0xFFCD9933);
const colorSecondary = Color(0xFFe0e0e0);
const colorError = Color.fromARGB(201, 212, 0, 0);

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: colorPrimary,
  errorColor: colorError,
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: colorPrimary,
  errorColor: colorError,
);
