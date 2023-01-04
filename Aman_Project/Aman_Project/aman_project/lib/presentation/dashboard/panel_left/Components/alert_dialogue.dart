import 'package:flutter/material.dart';

import '../../../../models/set_role.dart';

class AlertDailogue extends StatefulWidget {
  String email;
  final ValueChanged<int> update;
  AlertDailogue({super.key, required this.email, required this.update});

  @override
  State<AlertDailogue> createState() => _AlertDailogueState();
}

class _AlertDailogueState extends State<AlertDailogue> {
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
            onPressed: () => {
                  changeRole(widget.email, dropdownvalue),
                  widget.update(100),
                  Navigator.of(context).pop(),
                },
            child: const Text("Submit")),
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
    );
  }
}
