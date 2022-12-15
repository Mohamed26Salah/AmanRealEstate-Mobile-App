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
  static var people = [
    // Person('Mike', 'Barron'),
    // Person('Todd', 'Black'),
    // Person('Ahmad', 'Edwards'),
    // Person('Anthony', 'Johnson'),
    // Person('Annette', 'Brooks'),
  ];
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () => showSearch(
                                context: context,
                                delegate: SearchPage(
                                  onQueryUpdate: print,
                                  items: people,
                                  searchLabel: 'Search people',
                                  suggestion: const Center(
                                    child: Text(
                                        'Filter people by name, surname or age'),
                                  ),
                                  failure: const Center(
                                    child: Text('No person found :('),
                                  ),
                                  filter: (person) => [
                                    person.name,
                                    person.surname,
                                  ],
                                  sort: (a, b) => a.compareTo(b),
                                  builder: (person) => ListTile(
                                    leading: CircleAvatar(
                                        radius: 15,
                                        backgroundColor: const Color.fromARGB(
                                            255, 143, 39, 39),
                                        child: Text(
                                          person.name.substring(0, 1),
                                          style: const TextStyle(
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0)),
                                        )),
                                    title: Text(person.name),
                                    subtitle: Text(person.surname),
                                    trailing: MyEditButton(
                                        onPressed: () {
                                          // openDialog(person.name);
                                        },
                                        height: 35,
                                        borderRadius: BorderRadius.circular(20),
                                        child: const Icon(
                                          Icons.edit_outlined,
                                        )),
                                  ),
                                ),
                              ),
                          child: const Icon(Icons.search)),
                    ],
                  ),
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
