import 'package:flutter/material.dart';
import 'package:search_page/search_page.dart';

import '../../../../models/users_list_data.dart';
import '../edit_button.dart';
import 'dart:math';
import 'dart:async';
import 'alert_dialogue.dart';

class UsersListWidget extends StatefulWidget {
  const UsersListWidget({super.key});

  @override
  State<UsersListWidget> createState() => _UsersListWidgetState();
}

class _UsersListWidgetState extends State<UsersListWidget> {
  Future<List<UserData>>? usertData;
  @override
  void initState() {
    super.initState();
    usertData = getData2();
  }

  void _update(dynamic int) {
    Timer(const Duration(seconds: 2), () {
      setState(() {
        usertData = getData2();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var rng = Random();
    var borderRadius = const BorderRadius.all(Radius.circular(10));

    Future openDialog({required String name, required ValueChanged update}) =>
        showDialog(
          context: context,
          builder: (context) => AlertDailogue(email: name, update: update),
        );
    return FutureBuilder(
      future: usertData,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        } else if (snapshot.hasData) {
          return Column(
            children: [
              const SizedBox(height: 10),
              ElevatedButton(
                  onPressed: () => showSearch(
                        context: context,
                        delegate: SearchPage(
                          onQueryUpdate: print,
                          items: snapshot.data!,
                          searchLabel: 'Search people',
                          suggestion: const Center(
                            child:
                                Text('Filter people by name, surname or age'),
                          ),
                          failure: const Center(
                            child: Text('No person found :('),
                          ),
                          filter: (person) => [
                            person.email,
                            person.role,
                          ],
                          sort: (a, b) => a.compareTo(b),
                          builder: (person) => ListTile(
                            leading: CircleAvatar(
                                radius: 15,
                                backgroundColor: Color.fromARGB(
                                    255,
                                    rng.nextInt(255),
                                    rng.nextInt(255),
                                    rng.nextInt(255)),
                                child: Text(
                                  person.email.substring(0, 1),
                                  style: const TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0)),
                                )),
                            title: Text(person.email),
                            subtitle: Text(person.role),
                            trailing: MyEditButton(
                                onPressed: () {
                                  openDialog(
                                      name: person.email, update: _update);
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
              Column(
                children: List.generate(
                  snapshot.data!.length,
                  (index) => ListTile(
                    shape: RoundedRectangleBorder(borderRadius: borderRadius),
                    // tileColor: Theme.of(context).splashColor,
                    leading: CircleAvatar(
                        radius: 15,
                        backgroundColor: Color.fromARGB(255, rng.nextInt(255),
                            rng.nextInt(255), rng.nextInt(255)),
                        child: Text(
                          snapshot.data![index].email.substring(0, 1),
                        )),
                    title: Text(snapshot.data![index].email),
                    subtitle: Text(snapshot.data![index].role),
                    trailing: MyEditButton(
                        onPressed: () {
                          openDialog(
                              name: snapshot.data![index].email,
                              update: _update);
                        },
                        height: 35,
                        borderRadius: BorderRadius.circular(20),
                        child: const Icon(
                          Icons.edit_outlined,
                        )),
                  ),
                ),
              ),
            ],
          );
        } else {
          return const Text("Loading");
        }
      },
    );

    // getData2().then(
    //     (value) => Column(
    //           children: List.generate(
    //             value.length,
    //             (index) => ListTile(
    //               leading: CircleAvatar(
    //                   radius: 15,
    //                   backgroundColor: const Color.fromARGB(255, 148, 15, 15),
    //                   child: Text(
    //                     value[index].email.substring(0, 1),
    //                     style: const TextStyle(color: Colors.white),
    //                   )),
    //               title: Text(value[index].email),
    //               subtitle: Text(value[index].role),
    //               textColor: const Color.fromARGB(255, 255, 255, 255),
    //               trailing: MyEditButton(
    //                   onPressed: () {
    //                     // openDialog(value[index].email);
    //                   },
    //                   height: 35,
    //                   borderRadius: BorderRadius.circular(20),
    //                   child: const Icon(
    //                     Icons.edit_outlined,
    //                   )),
    //             ),
    //           ),
    //         )).catchError((e) {
    //   print(e); // Oops, new error.
    // });
  }
}
