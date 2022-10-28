import 'package:flutter/material.dart';
import '../../constants.dart';
import 'package:aman_project/pages/DummyData/lastchanges.dart';
import 'package:search_page/search_page.dart';
import 'package:aman_project/pages/panel_right/searchbuttons.dart';

class list1 extends StatelessWidget {
  // ignore: non_constant_identifier_names

  // ignore: non_constant_identifier_names
  list1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 10),
          const searchbutton1(),
          const SizedBox(height: 25),
          Padding(
            padding:
                const EdgeInsets.only(right: 0, bottom: 0, top: 0, left: 0),
            child: Card(
              color: Constants.purpleLight,
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 70.0, vertical: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: List.generate(
                    properties.length,
                    (index2) => Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(properties[index2].name,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        const SizedBox(width: 30),
                        Text(properties[index2].code,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        const SizedBox(width: 30),
                        Text(properties[index2].type,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
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

class list2 extends StatelessWidget {
  // ignore: non_constant_identifier_names

  // ignore: non_constant_identifier_names
  list2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 10),
          const searchbutton2(),
          const SizedBox(height: 25),
          Padding(
            padding:
                const EdgeInsets.only(right: 0, bottom: 0, top: 0, left: 0),
            child: Card(
              color: Constants.purpleLight,
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 70.0, vertical: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: List.generate(
                    rents.length,
                    (index2) => Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(rents[index2].name,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        const SizedBox(width: 30),
                        Text(rents[index2].code,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        const SizedBox(width: 30),
                        Text(rents[index2].type,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
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
