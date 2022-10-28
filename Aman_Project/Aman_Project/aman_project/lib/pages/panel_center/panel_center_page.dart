import 'package:aman_project/pages/panel_right/list.dart';
import 'package:flutter/material.dart';

List<bool> isSelected = [true, false];

// ignore: use_key_in_widget_constructors
class PanelCenterPage extends StatefulWidget {
  @override

  // ignore: library_private_types_in_public_api
  PanelCenterPageState createState() => PanelCenterPageState();
}

class PanelCenterPageState extends State<PanelCenterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Column(
            children: [
              const SizedBox(height: 10),
              ToggleButtons(
                  // list of booleans
                  isSelected: isSelected,
                  // text color of selected toggle
                  selectedColor: Colors.white,
                  // text color of not selected toggle
                  color: Colors.blue,
                  // fill color of selected toggle
                  fillColor: Colors.lightBlue.shade900,
                  // when pressed, splash color is seen
                  splashColor: Colors.red,
                  // long press to identify highlight color
                  highlightColor: Colors.orange,
                  // if consistency is needed for all text style
                  textStyle: const TextStyle(fontWeight: FontWeight.bold),
                  // border properties for each toggle
                  renderBorder: true,
                  borderColor: Colors.black,
                  borderWidth: 1.5,
                  borderRadius: BorderRadius.circular(10),
                  selectedBorderColor: const Color.fromARGB(255, 255, 255, 255),
// add widgets for which the users need to toggle
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text('Propreties', style: TextStyle(fontSize: 18)),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text('Rents', style: TextStyle(fontSize: 18)),
                    ),
                  ],
// to select or deselect when pressed
                  onPressed: (int newIndex) {
                    setState(() {
                      // looping through the list of booleans values
                      for (int index = 0; index < isSelected.length; index++) {
                        // checking for the index value
                        if (index == newIndex) {
                          // one button is always set to true
                          isSelected[index] = true;
                        } else {
                          // other two will be set to false and not selected
                          isSelected[index] = false;
                        }
                      }
                    });
                  }),
              isSelected[0] ? list1() : list2(),
            ],
          )
        ],
      ),
    );
  }
}
