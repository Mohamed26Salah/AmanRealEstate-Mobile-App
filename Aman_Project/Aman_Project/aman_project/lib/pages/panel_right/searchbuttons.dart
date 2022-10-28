import 'package:flutter/material.dart';
import 'package:aman_project/pages/DummyData/lastchanges.dart';
import 'package:search_page/search_page.dart';

class searchbutton1 extends StatelessWidget {
  const searchbutton1({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => showSearch(
              context: context,
              delegate: SearchPage(
                onQueryUpdate: print,
                items: properties,
                searchLabel: 'Search people',
                suggestion: const Center(
                  child: Text('Filter people by name, surname or age'),
                ),
                failure: const Center(
                  child: Text('No person found :('),
                ),
                filter: (prop) => [
                  prop.name,
                  prop.code,
                  prop.type,
                ],
                sort: (a, b) => a.compareTo(b),
                builder: (prop) => ListTile(
                  leading: CircleAvatar(
                      radius: 15,
                      backgroundColor: const Color.fromARGB(255, 143, 39, 39),
                      child: Text(
                        prop.name.substring(0, 1),
                        style: const TextStyle(color: Colors.white),
                      )),
                  title: Text(prop.name),
                  subtitle: Text(prop.code),
                  trailing: Text(prop.type),
                  textColor: const Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
        child: const Icon(Icons.search));
  }
}

class searchbutton2 extends StatelessWidget {
  const searchbutton2({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => showSearch(
              context: context,
              delegate: SearchPage(
                onQueryUpdate: print,
                items: rents,
                searchLabel: 'Search people',
                suggestion: const Center(
                  child: Text('Filter people by name, surname or age'),
                ),
                failure: const Center(
                  child: Text('No person found :('),
                ),
                filter: (prop) => [
                  prop.name,
                  prop.code,
                  prop.type,
                ],
                sort: (a, b) => a.compareTo(b),
                builder: (prop) => ListTile(
                  leading: CircleAvatar(
                      radius: 15,
                      backgroundColor: const Color.fromARGB(255, 143, 39, 39),
                      child: Text(
                        prop.name.substring(0, 1),
                        style: const TextStyle(color: Colors.white),
                      )),
                  title: Text(prop.name),
                  subtitle: Text(prop.code),
                  trailing: Text(prop.type),
                  textColor: const Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
        child: const Icon(Icons.search));
  }
}
