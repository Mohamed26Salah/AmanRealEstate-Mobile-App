import 'package:flutter/material.dart';

const colorPrimary = Color(0xFFCD9933);
const colorSecondary = Color(0xFFe0e0e0);
const colorError = Color.fromARGB(255, 249, 71, 71);
const colorFocus = Color.fromARGB(255, 0, 166, 255);
const colorSplash = Color.fromARGB(255, 51, 205, 151);
const textColor = Color.fromARGB(255, 255, 255, 255);
Color blackColor = const Color.fromARGB(255, 0, 0, 0);
Color highlightColor = Colors.yellow.withOpacity(0.4);

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: colorPrimary,
  splashColor: colorSplash,
  errorColor: colorError,
  focusColor: colorFocus,
  highlightColor: highlightColor,
  backgroundColor: blackColor,
  primaryColorLight: textColor,
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: colorPrimary,
  errorColor: colorError,
  focusColor: colorFocus,
  highlightColor: highlightColor,
  backgroundColor: textColor,
  primaryColorLight: blackColor,
);
