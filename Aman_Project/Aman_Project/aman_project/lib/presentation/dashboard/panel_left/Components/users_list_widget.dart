import 'package:aman_project/data/repositories/user_providers.dart';
import 'package:aman_project/data/user_management.dart';
import 'package:aman_project/models/user.dart';
import 'package:aman_project/presentation/shared_features/custom_loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'edit_button.dart';
import 'dart:math';
import 'dart:async';
import 'user_role_dialogue.dart';

class UsersListWidget extends ConsumerStatefulWidget {
  const UsersListWidget({
    super.key,
  });

  @override
  ConsumerState<UsersListWidget> createState() => _UsersListWidgetState();
}

class _UsersListWidgetState extends ConsumerState<UsersListWidget> {
  List<UserModel> usertData = [];
  @override
  void initState() {
    super.initState();
  }

  void _update(dynamic int) {
    ref.read(usertDataProv.notifier).state = int;
  }

  @override
  Widget build(BuildContext context) {
    usertData = ref.watch(usertDataProv);
    // print("User data : " + ref.watch(usertDataProv).toString());
    var rng = Random();
    var borderRadius = const BorderRadius.all(Radius.circular(10));

    Future openDialog({required String name, required ValueChanged update}) =>
        showDialog(
          context: context,
          builder: (context) => UserRoleDialogue(email: name, update: update),
        );
    if (usertData.isEmpty) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text("no User Found"),
        ],
      );
    } else if (usertData[0].email == '') {
      UserHelper.getUsersRolesEmails(query: '').then((value) {
        ref.read(usertDataProv.notifier).state = value;
      });
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          LoadingScreen(),
        ],
      );
    } else {
      return Column(
        children: [
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: ListView.builder(
                itemCount: usertData.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    shape: RoundedRectangleBorder(borderRadius: borderRadius),
                    // tileColor: Theme.of(context).splashColor,
                    leading: CircleAvatar(
                        radius: 15,
                        backgroundColor: Theme.of(context).primaryColor,
                        child: Text(
                          usertData[index].email.substring(0, 1),
                          style: const TextStyle(color: Colors.black),
                        )),
                    title: Text(usertData[index].email),
                    subtitle: Text(usertData[index].role),
                    trailing: MyEditButton(
                        onPressed: () {
                          openDialog(
                              name: usertData[index].email, update: _update);
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
    }
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