// ignore_for_file: use_key_in_widget_constructors

import 'package:aman_project/presentation/dashboard/panel_left/edit_button.dart';

import '/models/users_list_data.dart';
import 'package:flutter/material.dart';
import 'package:search_page/search_page.dart';

import 'Components/bloc.dart';
import 'Components/users_list_widget.dart';

class PanelLeftPage extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _PanelLeftPageState createState() => _PanelLeftPageState();
}

class _PanelLeftPageState extends State<PanelLeftPage> {
  bool visible = false;
  bool _isExpanded = false;
  void _toogleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: const NavBarGR(),
      body: Stack(
        children: [
          ListView(
            children: [
              Column(
                children: [
                  const SizedBox(height: 25),
                  Wrap(
                    children: List.generate(1, (index) {
                      return ChartBlock(
                          width: MediaQuery.of(context).size.width,
                          index: index);
                    }),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 0, bottom: 0, top: 0, left: 0),
                    child: Card(
                        // color: ,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: UsersListWidget()),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
