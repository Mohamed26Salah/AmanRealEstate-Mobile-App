import 'package:aman_project/data/numbers_management.dart';
import 'package:aman_project/data/repositories/number_provider.dart';
import 'package:aman_project/models/number.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ListNumber extends ConsumerStatefulWidget {
  const ListNumber({
    super.key,
  });

  @override
  ConsumerState<ListNumber> createState() => _ListNumberState();
}

class _ListNumberState extends ConsumerState<ListNumber> {
  @override
  Widget build(BuildContext context) {
    List<Number> numbersList = ref.watch(numberProv);
    return ListView.builder(
        itemCount: numbersList.length,
        itemBuilder: ((context, index) {
          return Card(
            elevation: 5,
            child: ListTile(
              leading: Card(
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: Theme.of(context).primaryColor, width: 2),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(numbersList[index].name),
                  )),
              title: Text(numbersList[index].number),
              trailing: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Theme.of(context).errorColor)),
                  onPressed: () {
                    NumberManagement.deleteNumber(numbersList[index].Id)
                        .then((value) {
                      if (value) {
                        var temp = ref.watch(numberProv);
                        temp.remove(numbersList[index]);
                        ref.read(numberProv.notifier).state = temp.toList();
                      } else {
                        // print("failed to remove number");
                      }
                    });
                  },
                  child: const Icon(Icons.delete_rounded)),
            ),
          );
        }));
  }
}
