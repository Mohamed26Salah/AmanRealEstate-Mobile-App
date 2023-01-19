import 'package:flutter/material.dart';

import 'colors.dart';

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
  splashColor: colorSplash,
  errorColor: colorError,
  focusColor: colorFocus,
  highlightColor: highlightColor,
  backgroundColor: textColor,
  primaryColorLight: blackColor,
);
