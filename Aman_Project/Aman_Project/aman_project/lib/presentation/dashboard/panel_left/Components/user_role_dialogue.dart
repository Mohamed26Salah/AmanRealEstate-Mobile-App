import 'package:aman_project/data/repositories/user_providers.dart';
import 'package:aman_project/data/user_management.dart';
import 'package:aman_project/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

class UserRoleDialogue extends ConsumerStatefulWidget {
  final String email;
  final ValueChanged<List<UserModel>>? update;
  const UserRoleDialogue({super.key, required this.email, this.update});

  @override
  ConsumerState<UserRoleDialogue> createState() => _UserRoleDialogueState();
}

class _UserRoleDialogueState extends ConsumerState<UserRoleDialogue> {
  var items = [
    'user',
    'moderator',
  ];
  var dropdownvalue = 'user';
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.email),
      content: DropdownButton(
        value: dropdownvalue,
        items: items.map((String items) {
          return DropdownMenuItem(
            value: items,
            child: Text(items),
          );
        }).toList(),
        onChanged: (String? value) {
          setState(() {
            dropdownvalue = value!;
          });
        },
      ),
      actions: [
        TextButton(
            onPressed: () {
              var temp = ref.watch(queryProv);
              UserHelper.changeRole(widget.email, dropdownvalue).then((value) {
                if (value) {
                  UserHelper.getUsersRolesEmails(query: temp).then((value2) {
                    if (widget.update != null) {
                      widget.update!(value2);
                    }
                  });
                }
              });

              Navigator.of(context).pop();
            },
            child: Text("Submit".tr)),
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("Cancel".tr)),
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("Delete".tr,
                style: TextStyle(color: Theme.of(context).errorColor)))
      ],
    );
  }
}
