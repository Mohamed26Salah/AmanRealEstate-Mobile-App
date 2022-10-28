import 'package:ama/constants.dart';
import 'package:ama/pages/drawer/drawer_page.dart';
import 'package:ama/pages/panel_center/panel_center_page.dart';
import 'package:ama/pages/panel_left/panel_left_page.dart';
import 'package:ama/pages/panel_right/panel_right_page.dart';
import 'package:ama/pages/widgets/app_bar_widget.dart';
import 'package:ama/responsive_layout.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class WidgetTree extends StatefulWidget {
  @override
  _WidgetTreeState createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  int currentIndex = 1;

  final List<Widget> _icons = [
    const Icon(Icons.add, size: 30),
    const Icon(Icons.compare_arrows, size: 30),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentIndex == 0 ? PanelLeftPage() : PanelRightPage(),
      bottomNavigationBar: ResponsiveLayout.isPhone(context)
          ? CurvedNavigationBar(
              index: currentIndex,
              backgroundColor: Constants.purpleDark,
              items: _icons,
              onTap: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
            )
          : const SizedBox(),
    );
  }
}
