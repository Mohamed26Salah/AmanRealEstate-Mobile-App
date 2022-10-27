import 'package:flutter/material.dart';

class RentType extends StatefulWidget {
  const RentType({Key? key}) : super(key: key);

  @override
  _RentTypeState createState() => _RentTypeState();
}

class _RentTypeState extends State<RentType> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12.0,
          mainAxisSpacing: 12.0,
        ),
        itemCount: 100,
        itemBuilder: (_, index) {
          return Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  12.0,
                ),
                color: Color.fromARGB(255, 57, 54, 54)),
          );
        },
      ),
    );
  }
}
