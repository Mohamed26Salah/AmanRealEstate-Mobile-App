import 'package:flutter/material.dart';
import '../../constants.dart';
import 'package:ama/pages/DummyData/lastchanges.dart';

class list1 extends StatelessWidget {
  const list1({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 25),
          Padding(
            padding:
                const EdgeInsets.only(right: 0, bottom: 0, top: 0, left: 0),
            child: Card(
              color: Constants.purpleLight,
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: List.generate(
                  properties.length,
                  (index) => ListTile(
                    leading: CircleAvatar(
                        radius: 15,
                        backgroundColor: const Color.fromARGB(255, 148, 15, 15),
                        child: Text(
                          properties[index].name.substring(0, 1),
                          style: const TextStyle(color: Colors.white),
                        )),
                    title: Text(properties[index].name),
                    subtitle: Text(properties[index].code),
                    trailing: Text(properties[index].type),
                    textColor: const Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
