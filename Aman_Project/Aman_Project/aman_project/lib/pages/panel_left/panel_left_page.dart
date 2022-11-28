// ignore_for_file: use_key_in_widget_constructors
import '/./pages/DummyData/person.dart';
import '/./responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:search_page/search_page.dart';
import '/./pages/panel_left/edit_button.dart';
import '../../constants.dart';
import '/./pages/panel_left/cards.dart';

class PanelLeftPage extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _PanelLeftPageState createState() => _PanelLeftPageState();
}

class _PanelLeftPageState extends State<PanelLeftPage> {
  static var people = [
    Person('Mike', 'Barron'),
    Person('Todd', 'Black'),
    Person('Ahmad', 'Edwards'),
    Person('Anthony', 'Johnson'),
    Person('Annette', 'Brooks'),
  ];
  bool visible = false;
  @override
  Widget build(BuildContext context) {
    Future openDialog([String? name]) => showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(name ?? "Yoo"),
            content: const TextField(
              decoration: InputDecoration(hintText: 'enter name'),
            ),
            actions: [
              const TextButton(onPressed: null, child: Text("Submit")),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Cancel")),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Delete",
                      style: TextStyle(color: Color.fromARGB(255, 255, 0, 0))))
            ],
          ),
        );
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
                                          openDialog(person.name);
                                        },
                                        height: 35,
                                        borderRadius: BorderRadius.circular(20),
                                        child: const Icon(
                                          Icons.edit_outlined,
                                        )),
                                    textColor: Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ),
                              ),
                          child: const Icon(Icons.search)),
                    ],
                  ),
                  const SizedBox(height: 25),
                  const cards1(),
                  const cards1(text: "Rents", icon: 0xf1e0),
                  const cards1(text: "Users", icon: 0xf522),
                  const SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 0, bottom: 0, top: 0, left: 0),
                    child: Card(
                      color: Constants.purpleLight,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: List.generate(
                          people.length,
                          (index) => ListTile(
                            leading: CircleAvatar(
                                radius: 15,
                                backgroundColor:
                                    const Color.fromARGB(255, 148, 15, 15),
                                child: Text(
                                  people[index].name.substring(0, 1),
                                  style: const TextStyle(color: Colors.white),
                                )),
                            title: Text(people[index].name),
                            subtitle: Text(people[index].surname),
                            textColor: const Color.fromARGB(255, 255, 255, 255),
                            trailing: MyEditButton(
                                onPressed: () {
                                  openDialog(people[index].name);
                                },
                                height: 35,
                                borderRadius: BorderRadius.circular(20),
                                child: const Icon(
                                  Icons.edit_outlined,
                                )),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
    // ignore: dead_code
  }
}
