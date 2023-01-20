import 'package:aman_project/data/user_management.dart';
import 'package:aman_project/models/user.dart';
import 'package:aman_project/presentation/shared_features/custom_loading_screen.dart';
import 'package:flutter/material.dart';
import 'edit_button.dart';
import 'dart:math';
import 'dart:async';
import 'user_role_dialogue.dart';

class UsersListWidget extends StatefulWidget {
  final String? query;
  const UsersListWidget({super.key, required this.query});

  @override
  State<UsersListWidget> createState() => _UsersListWidgetState();
}

class _UsersListWidgetState extends State<UsersListWidget> {
  Future<List<UserModel>>? usertData;
  @override
  void initState() {
    super.initState();

    usertData = UserHelper.getUsersRolesEmails(query: widget.query);
  }

  void _update(dynamic int) {
    Timer(const Duration(seconds: 2), () {
      setState(() {
        usertData = UserHelper.getUsersRolesEmails(query: widget.query);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    usertData = UserHelper.getUsersRolesEmails(query: widget.query);
    var rng = Random();
    var borderRadius = const BorderRadius.all(Radius.circular(10));

    Future openDialog({required String name, required ValueChanged update}) =>
        showDialog(
          context: context,
          builder: (context) => UserRoleDialogue(email: name, update: update),
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
                Center(
                  child: LoadingScreen(),
                ),
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
