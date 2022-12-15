import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../models/users_list_data.dart';
import '../edit_button.dart';

class UsersListWidget extends StatefulWidget {
  UsersListWidget({super.key});

  @override
  State<UsersListWidget> createState() => _UsersListWidgetState();
}

class _UsersListWidgetState extends State<UsersListWidget> {
  Future<List<UserData>>? usertData;
  void initState() {
    super.initState();
    usertData = getData2();
  }

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
                  child: Text("Delete",
                      style: TextStyle(color: Theme.of(context).errorColor)))
            ],
          ),
        );
    return FutureBuilder(
      future: usertData,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        } else if (snapshot.hasData) {
          return Column(
            children: List.generate(
              snapshot.data!.length,
              (index) => ListTile(
                leading: CircleAvatar(
                    radius: 15,
                    backgroundColor: const Color.fromARGB(255, 148, 15, 15),
                    child: Text(
                      snapshot.data![index].email.substring(0, 1),
                      style: const TextStyle(color: Colors.white),
                    )),
                title: Text(snapshot.data![index].email),
                subtitle: Text(snapshot.data![index].role),
                textColor: const Color.fromARGB(255, 255, 255, 255),
                trailing: MyEditButton(
                    onPressed: () {
                      openDialog(snapshot.data![index].email);
                    },
                    height: 35,
                    borderRadius: BorderRadius.circular(20),
                    child: const Icon(
                      Icons.edit_outlined,
                    )),
              ),
            ),
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
