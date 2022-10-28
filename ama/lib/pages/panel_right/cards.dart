// ignore: unused_import
import 'dart:ffi';

import 'package:ama/constants.dart';
import 'package:flutter/material.dart';

class cards1 extends StatelessWidget {
  final String text;
  final String num;
  final int icon;
  const cards1(
      {super.key, this.text = "Units", this.num = "0", this.icon = 0xf107});

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 8,
        shadowColor: const Color.fromARGB(255, 0, 0, 0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: Constants.orange,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: const LinearGradient(
                  stops: [0.1, 0.3],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromARGB(255, 63, 77, 120),
                    Color.fromARGB(255, 79, 10, 68),
                  ])),
          child: Padding(
              padding: const EdgeInsets.all(50),
              child: Row(
                children: [
                  Icon(
                    IconData(icon, fontFamily: 'MaterialIcons'),
                    size: 100,
                    color: Colors.white,
                  ),
                  Text(text,
                      textScaleFactor: 2,
                      style: const TextStyle(color: Colors.white)),
                ],
              )),
        ));
  }
}
