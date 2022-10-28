import 'package:ama/constants.dart';
import 'package:ama/widget_tree.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Admin Panel',
      theme: ThemeData(
          scaffoldBackgroundColor: Constants.purpleDark,
          primarySwatch: Colors.blue,
          canvasColor: Constants.purpleLight),
      home: WidgetTree(),
    );
  }
}
