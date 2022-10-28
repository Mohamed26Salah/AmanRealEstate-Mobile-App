import './pages/panel_left/panel_left_page.dart';
import 'package:flutter/material.dart';

class WidgetTree extends StatefulWidget {
  @override
  _WidgetTreeState createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  int currentIndex = 1;

  final List<Widget> _icons = [
    const Icon(Icons.add, size: 30),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PanelLeftPage(),
    );
  }
}
