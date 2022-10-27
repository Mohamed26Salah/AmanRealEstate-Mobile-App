import 'package:aman_mobile/widgets/bottom_nav_bar.dart';
import 'package:aman_mobile/widgets/edit_profile.dart';
import 'package:aman_mobile/widgets/search.dart';

import '../widgets/property_description.dart';

import 'package:flutter/material.dart';

import 'package:aman_mobile/data/data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Property> properties = getPropertyList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Aman Real Estate"),
      ),
      body: const SafeArea(
        child: Search(),
      ),
      bottomNavigationBar: NavBar(),
    );
  }
}
