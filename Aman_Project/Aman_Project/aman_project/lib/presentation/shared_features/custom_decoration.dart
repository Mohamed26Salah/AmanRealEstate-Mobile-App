import 'package:aman_project/theme/colors.dart';
import 'package:flutter/material.dart';

class CommonStyle {
  static InputDecoration textFieldStyle(
      {String labelText = "",
      String hintText = "",
      String? value,
      BuildContext? context}) {
    var contextTextColor =
        context == null ? blackColor : Theme.of(context).backgroundColor;
    return InputDecoration(
      contentPadding: const EdgeInsets.all(12),
      labelText: labelText,
      hintText: hintText,
      hintStyle: TextStyle(color: contextTextColor),
      labelStyle: TextStyle(color: contextTextColor),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: colorPrimary),
        borderRadius: BorderRadius.circular(12),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: colorPrimary),
        borderRadius: BorderRadius.circular(12),
      ),
      filled: true,
    );
  }
}

extension ExtString on String {
  bool get isValidEmail {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(this);
  }

  bool get isValidName {
    final nameRegExp = RegExp(
        "^[\u0600-\u065F\u066A-\u06EF\u06FA-\u06FFa-zA-Z ]+[\u0600-\u065F\u066A-\u06EF\u06FA-\u06FFa-zA-Z0-9-_ \\.]*");
    return nameRegExp.hasMatch(this);
  }

  bool get isValidPassword {
    final passwordRegExp = RegExp(r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$");
    return passwordRegExp.hasMatch(this);
  }

  // bool get isNotNull {
  //   return this != null;
  // }

  bool get isValidPhone {
    final phoneRegExp = RegExp(r"^\+?0[0-9]{10}$");
    return phoneRegExp.hasMatch(this);
  }

  bool get isValidAddress {
    final phoneRegExp = RegExp(
        "^[\u0600-\u065F\u066A-\u06EF\u06FA-\u06FFa-zA-Z ]+[\u0600-\u065F\u066A-\u06EF\u06FA-\u06FFa-zA-Z0-9-_ \\.]*");

    return phoneRegExp.hasMatch(this);
  }

  bool get isValidCode {
    final phoneRegExp = RegExp(r"^[A-Z0-9]*$");
    return phoneRegExp.hasMatch(this);
  }

//putting* allow Null !!
//+ one or more
  bool get isValidNumber {
    final phoneRegExp = RegExp(r"^[0-9]+$");
    return phoneRegExp.hasMatch(this);
  }

  bool get isValidNameArabic {
    // ignore: valid_regexps
    final nameRegExp = RegExp(
        r"^[\u0600-\u065F\u066A-\u06EF\u06FA-\u06FFa-zA-Z ]+[\u0600-\u065F\u066A-\u06EF\u06FA-\u06FFa-zA-Z0-9-_ ]*$");
    return nameRegExp.hasMatch(this);
  }
}
