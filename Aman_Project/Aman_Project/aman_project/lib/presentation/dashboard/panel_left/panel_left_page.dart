// ignore_for_file: use_key_in_widget_constructors

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
  String? query;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: const NavBarGR(),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 24, left: 24, right: 24, bottom: 0),
              child: TextField(
                autofocus: false,
                enableInteractiveSelection: false,
                // onChanged: (value) {
                //   ref.read(searchInputProivder.notifier).state = value;
                // },
                onSubmitted: (value) {
                  setState(() {
                    query = value;
                  });
                },
                style: const TextStyle(
                  fontSize: 28,
                  height: 1,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: TextStyle(
                    fontSize: 28,
                    color: Colors.grey[400],
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: (Colors.grey[400])!,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: (Colors.grey[400])!,
                    ),
                  ),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: (Colors.grey[400])!,
                    ),
                  ),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween, // added line
                      mainAxisSize: MainAxisSize.min, // added li
                      children: [
                        Icon(
                          Icons.search,
                          color: Colors.grey[400],
                          size: 28,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.shortestSide / 1.3,
              width: MediaQuery.of(context).size.width,
              child: Card(
                  // color: ,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: UsersListWidget(query: query)),
            ),
            Column(
              children: [
                Wrap(children: [
                  ChartBlock(
                    width: MediaQuery.of(context).size.width,
                  ),
                  ChartBlock(
                    width: MediaQuery.of(context).size.width,
                    text: "Users",
                    icon: 0xeb93,
                    dataNum: 1,
                  )
                ]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
