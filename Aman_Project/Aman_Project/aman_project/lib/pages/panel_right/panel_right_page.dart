// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:aman_project/constants.dart';
import 'package:aman_project/pages/charts.dart';
import 'package:flutter/material.dart';
import 'package:aman_project/pages/panel_left/cards.dart';

class PanelRightPage extends StatefulWidget {
  @override
  _PanelRightPageState createState() => _PanelRightPageState();
}

class _PanelRightPageState extends State<PanelRightPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                cards1(),
                cards1(text: "Rents", icon: 0xf1e0),
                cards1(text: "Users", icon: 0xf522)
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
