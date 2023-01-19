import 'package:aman_project/data/user_management.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserRoleDialogue extends StatefulWidget {
  final String email;
  final ValueChanged<int>? update;
  const UserRoleDialogue({super.key, required this.email, this.update});

  @override
  State<UserRoleDialogue> createState() => _UserRoleDialogueState();
}

class _UserRoleDialogueState extends State<UserRoleDialogue> {
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
              UserHelper.changeRole(widget.email, dropdownvalue);
              if (widget.update != null) {
                widget.update!(100);
              }
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
