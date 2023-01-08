import 'package:aman_project/data/user_management.dart';
import 'package:aman_project/models/user.dart';
import 'package:flutter/material.dart';
import 'package:search_page/search_page.dart';
import '../edit_button.dart';
import 'dart:math';
import 'dart:async';
import 'alert_dialogue.dart';

class UsersListWidget extends StatefulWidget {
  String? query;
  UsersListWidget({super.key, this.query});

  @override
  State<UsersListWidget> createState() => _UsersListWidgetState();
}

class _UsersListWidgetState extends State<UsersListWidget> {
  Future<List<UserModel>>? usertData;
  @override
  void initState() {
    super.initState();

    usertData = UserHelper.getData2User(query: widget.query);
  }

  void _update(dynamic int) {
    Timer(const Duration(seconds: 2), () {
      setState(() {
        usertData = UserHelper.getData2User(query: widget.query);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    usertData = UserHelper.getData2User(query: widget.query);
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
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        shape:
                            RoundedRectangleBorder(borderRadius: borderRadius),
                        // tileColor: Theme.of(context).splashColor,
                        leading: CircleAvatar(
                            radius: 15,
                            backgroundColor: Theme.of(context).primaryColor,
                            child: Text(
                              snapshot.data![index].email.substring(0, 1),
                              style: const TextStyle(color: Colors.black),
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
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        } else {
          return Padding(
            padding: const EdgeInsets.all(50.0),
            child: Column(
              children: const [
                CircularProgressIndicator(),
                SizedBox(height: 10),
                Text("Loading Users"),
              ],
            ),
          );
        }
      },
    );
  }
}

/*   
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
      */             