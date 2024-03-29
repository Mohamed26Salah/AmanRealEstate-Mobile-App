import 'package:aman_project/data/numbers_management.dart';
import 'package:aman_project/data/repositories/number_provider.dart';
import 'package:aman_project/models/number.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:no_glow_scroll/no_glow_scroll.dart';

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
    return NoGlowScroll(
      child: ListView.builder(
          itemCount: numbersList.length,
          itemBuilder: ((context, index) {
            return Card(
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
                      child: Container(
                          constraints: const BoxConstraints(maxWidth: 59),
                          child: AutoSizeText(
                            minFontSize: 1,
                            numbersList[index].name,
                          )),
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
                          try {
                            temp.remove(numbersList[index]);
                          } catch (e) {
                          }

                          ref.read(numberProv.notifier).state = temp.toList();
                        } else {
                          // print("failed to remove number");
                        }
                      });
                    },
                    child: const Icon(Icons.delete_rounded)),
              ),
            );
          })),
    );
  }
}
