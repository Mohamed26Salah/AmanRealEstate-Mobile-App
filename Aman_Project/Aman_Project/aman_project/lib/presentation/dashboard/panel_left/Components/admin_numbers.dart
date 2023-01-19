import 'package:aman_project/common_widgets/extracted_widgets.dart';
import 'package:aman_project/data/numbers_management.dart';
import 'package:aman_project/data/repositories/number_provider.dart';

import 'package:aman_project/presentation/dashboard/panel_left/Components/add_number_dialogue.dart';
import 'package:aman_project/presentation/dashboard/panel_left/Components/list_numbers.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

class AdminNumbers extends ConsumerStatefulWidget {
  const AdminNumbers({super.key});

  @override
  ConsumerState<AdminNumbers> createState() => _EditNumberState();
}

class _EditNumberState extends ConsumerState<AdminNumbers> {
  Future openDialog({required String name, ValueChanged? update}) => showDialog(
        context: context,
        builder: (context) => AddNumberDialogue(
          email: name,
          update: update,
          disable: ref.watch(numberProv).length >= 10,
        ),
      );
  @override
  Widget build(BuildContext context) {
    NumberManagement.getNumbers().then((value) {
      ref.read(numberProv.notifier).state = value;
    });
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(2),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                // Text(
                //   "Admin Numbers",
                //   style: TextStyle(color: Theme.of(context).primaryColor),
                // ),
                ExtractedWidgets().strokeWidget(
                    "Admin Numbers".tr, 20, Theme.of(context).primaryColor),
                SizedBox(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  child: const ListNumber(),
                ),
                ElevatedButton(
                    onPressed: () {
                      openDialog(name: "Add Number".tr);
                    },
                    child: const Icon(Icons.add))
              ],
            ),
          )),
    );
  }
}
