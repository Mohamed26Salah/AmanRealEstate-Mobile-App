import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    Key? key,
    required this.hintText,
    required this.labelText,
    required this.obscureText,
    this.inputFormatters,
    this.validator,
  }) : super(key: key);
  final String hintText;
  final String labelText;
  final bool obscureText;

  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      inputFormatters: inputFormatters,
      validator: validator,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 205, 153, 51)),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 205, 153, 51)),
          borderRadius: BorderRadius.circular(12),
        ),
        fillColor: Colors.grey[200],
        filled: true,
      ),
    );
  }
}

extension extString on String {
  bool get isValidEmail {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(this);
  }

  bool get isValidName {
    final nameRegExp =
        new RegExp(r"^[\w'\-,.][^0-9_!¡?÷?¿/\\+=@#$%ˆ&*(){}|~<>;:[\]]{2,}$");
    return nameRegExp.hasMatch(this);
  }

  bool get isValidPassword {
    final passwordRegExp = RegExp(r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$");
    return passwordRegExp.hasMatch(this);
  }

  bool get isNotNull {
    return this != null;
  }

  bool get isValidPhone {
    final phoneRegExp = RegExp(r"^\+?0[0-9]{10}$");
    return phoneRegExp.hasMatch(this);
  }

  bool get isValidAddress {
    final phoneRegExp = RegExp(r"[A-Za-z0-9'\.\-\s\,]");
    return phoneRegExp.hasMatch(this);
  }

  bool get isValidCode {
    final phoneRegExp = RegExp(r"^[A-Z0-9]*$");
    return phoneRegExp.hasMatch(this);
  }

  bool get isValidNumber {
    final phoneRegExp = RegExp(r"^[0-9]*$");
    return phoneRegExp.hasMatch(this);
  }
}
