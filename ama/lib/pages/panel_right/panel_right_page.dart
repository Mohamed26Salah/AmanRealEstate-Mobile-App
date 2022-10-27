import 'package:ama/constants.dart';
import 'package:ama/pages/charts.dart';
import 'package:flutter/material.dart';

class PanelRightPage extends StatefulWidget {
  @override
  _PanelRightPageState createState() => _PanelRightPageState();
}

class _PanelRightPageState extends State<PanelRightPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        const Card(
          color: Constants.purpleDark,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
                elevation: 8,
                shadowColor: Constants.red,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: Constants.orange,
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Color.fromARGB(255, 63, 77, 120),
                    Color.fromARGB(255, 79, 10, 68)
                  ])),
                  child: Padding(
                      padding: EdgeInsets.all(130), child: Text("Units")),
                )),
          ],
        )
      ],
    ));
  }
}
