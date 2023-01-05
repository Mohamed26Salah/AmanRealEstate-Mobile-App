// ignore_for_file: use_key_in_widget_constructors

import 'package:aman_project/presentation/dashboard/panel_left/dash_board_users.dart';
import 'package:flutter/material.dart';

import 'Components/block.dart';
import 'Components/users_list_widget.dart';

class PanelLeftPage extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _PanelLeftPageState createState() => _PanelLeftPageState();
}

class _PanelLeftPageState extends State<PanelLeftPage> {
  bool visible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: const NavBarGR(),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: ListView(
          children: [
            Column(
              children: [
                const DashBoardUsers(),
                Wrap(alignment: WrapAlignment.center, children: [
                  ChartBlock(
                    width: MediaQuery.of(context).size.width,
                  ),
                  ChartBlock(
                    width: MediaQuery.of(context).size.width,
                    text: "Users",
                    icon: 0xeb93,
                    dataNum: 1,
                  ),
                  ChartBlock(
                    width: MediaQuery.of(context).size.width,
                    text: "Rents",
                    icon: 0xf0624,
                    dataNum: 2,
                  ),
                ]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
