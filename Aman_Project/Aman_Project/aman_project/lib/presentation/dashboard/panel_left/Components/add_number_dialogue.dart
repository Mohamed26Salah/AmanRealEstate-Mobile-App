import 'package:aman_project/data/numbers_management.dart';
import 'package:aman_project/data/repositories/number_provider.dart';
import 'package:aman_project/models/number.dart';
import 'package:aman_project/models/property.dart';
import 'package:aman_project/presentation/shared_features/custom_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class AlertDailogue2 extends ConsumerStatefulWidget {
  String email;
  final ValueChanged<int>? update;
  bool disable;
  AlertDailogue2(
      {super.key, required this.email, this.update, required this.disable});

  @override
  ConsumerState<AlertDailogue2> createState() => _AlertDailogue2State();
}

class _AlertDailogue2State extends ConsumerState<AlertDailogue2> {
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.email),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Property.buildTextField(
                  labelText: "name",
                  hintText: "",
                  controller: nameController,
                  type: "name"),
              Property.buildTextField(
                  labelText: "number",
                  hintText: "010XXXXXX",
                  controller: numberController,
                  type: "phone"),
            ],
          ),
        ),
      ),
      actions: [
        Visibility(
            visible: widget.disable,
            child: const Text(
                "Can't add more than 10 numbers please delete one to add another")),
        TextButton(
            onPressed: widget.disable
                ? null
                : () {
                    if (_formKey.currentState!.validate()) {
                      String builtId;
                      NumberManagement.addNumber(
                              '', nameController.text, numberController.text)
                          .then((value) {
                        if (value != '') {
                          builtId = value;
                          var temp = ref.watch(numberProv);
                          //problme here
                          temp.add(Number(
                              Id: builtId,
                              name: nameController.text,
                              number: numberController.text));
                          ref.read(numberProv.notifier).state = temp.toList();
                          // print("added Number");
                        } else {
                          //print("Error happened");
                        }
                      });

                      //print("scass" + ref.watch(numberProv).toString());
                      Navigator.of(context).pop();
                    }
                  },
            child: const Text("Submit")),
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("Cancel",
                style: TextStyle(color: Theme.of(context).errorColor)))
      ],
    );
  }
}
