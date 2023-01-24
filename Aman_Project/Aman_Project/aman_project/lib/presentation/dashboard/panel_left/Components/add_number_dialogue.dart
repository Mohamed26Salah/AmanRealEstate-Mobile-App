import 'package:aman_project/data/form_management.dart';
import 'package:aman_project/data/numbers_management.dart';
import 'package:aman_project/data/repositories/number_provider.dart';
import 'package:aman_project/models/number.dart';
import 'package:aman_project/presentation/shared_features/custom_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class AddNumberDialogue extends ConsumerStatefulWidget {
  final String email;
  final ValueChanged<int>? update;
  final bool disable;
  const AddNumberDialogue(
      {super.key, required this.email, this.update, required this.disable});

  @override
  ConsumerState<AddNumberDialogue> createState() => _AlertDailogue2State();
}

class _AlertDailogue2State extends ConsumerState<AddNumberDialogue> {
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
              Padding(
                padding: const EdgeInsets.only(
                    top: 0, left: 15, right: 15, bottom: 10),
                child: TextFormField(
                  decoration: CommonStyle.textFieldStyle(
                      labelText: "name".tr, context: context),
                  controller: nameController,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(20),
                    FilteringTextInputFormatter.allow(
                      RegExp(
                          "^[\u0600-\u065F\u066A-\u06EF\u06FA-\u06FFa-zA-Z ]+[\u0600-\u065F\u066A-\u06EF\u06FA-\u06FFa-zA-Z0-9-_ \\.]*"),
                    )
                  ],
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "name is required".tr;
                    }
                    return null;
                  },
                ),
              ),
              FormManagement.buildTextField(
                  labelText: "number".tr,
                  hintText: "010XXXXXX",
                  controller: numberController,
                  type: "phone",
                  context: context),
            ],
          ),
        ),
      ),
      actions: [
        Visibility(
            visible: widget.disable,
            child: Text(
                "Cant add more than 10 numbers please delete one to add another"
                    .tr)),
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
                          temp.add(Number(
                              Id: builtId,
                              name: nameController.text,
                              number: numberController.text));
                          ref.read(numberProv.notifier).state = temp.toList();
                        } else {}
                      });
                      Navigator.of(context).pop();
                    }
                  },
            child: Text("Submit".tr)),
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("Cancel".tr,
                style: TextStyle(color: Theme.of(context).errorColor)))
      ],
    );
  }
}
