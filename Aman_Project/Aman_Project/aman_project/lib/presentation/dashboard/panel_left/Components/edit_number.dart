import 'package:aman_project/common_widgets/property_details.dart';
import 'package:aman_project/data/numbers_management.dart';
import 'package:aman_project/data/repositories/number_provider.dart';
import 'package:aman_project/presentation/dashboard/panel_left/Components/alert_dialogue.dart';
import 'package:aman_project/presentation/dashboard/panel_left/Components/alert_dialogue2.dart';
import 'package:aman_project/presentation/dashboard/panel_left/Components/list_numbers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EditNumber extends ConsumerStatefulWidget {
  const EditNumber({super.key});

  @override
  ConsumerState<EditNumber> createState() => _EditNumberState();
}

class _EditNumberState extends ConsumerState<EditNumber> {
  Future openDialog({required String name, ValueChanged? update}) => showDialog(
        context: context,
        builder: (context) => AlertDailogue2(
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
    return Card(
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
                  "Admin Numbers", 20, Theme.of(context).primaryColor),
              SizedBox(
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: const ListNumber(),
              ),
              ElevatedButton(
                  onPressed: () {
                    openDialog(name: "Add Number");
                  },
                  child: Icon(Icons.add))
            ],
          ),
        ));
  }
}
