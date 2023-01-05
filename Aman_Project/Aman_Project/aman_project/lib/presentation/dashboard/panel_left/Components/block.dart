import 'package:aman_project/data/property_managemnt.dart';
import 'package:aman_project/data/rents_management.dart';
import 'package:aman_project/data/user_management.dart';
import 'package:flutter/material.dart';
import '../../../../models/chart_data.dart';
import 'cards.dart';

class ChartBlock extends StatefulWidget {
  final double width;
  final String text;
  final int icon;
  final int dataNum;
  bool isExpanded;
  ChartBlock(
      {super.key,
      required this.width,
      this.isExpanded = false,
      this.text = "Units",
      this.icon = 0xf107,
      this.dataNum = 0});

  @override
  State<ChartBlock> createState() => _ChartBlockState();
}

class _ChartBlockState extends State<ChartBlock> {
  Future<List<ChartData>>? chartData;
  @override
  void initState() {
    super.initState();
    if (widget.dataNum == 0) {
      chartData = PropertyManagement.getData();
    } else if (widget.dataNum == 1) {
      chartData = UserHelper.getData2();
    } else if (widget.dataNum == 2) {
      chartData = RentsManagement.getData3();
    } else {
      chartData = PropertyManagement.getData();
    }
  }

  bool onend = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          //changing the current expandableState
          widget.isExpanded = !widget.isExpanded;
          if (!widget.isExpanded) {
            onend = false;
          }
        });
      },
      child: FutureBuilder(
        future: chartData,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else if (snapshot.hasData) {
            return AnimatedContainer(
              curve: Curves.easeInOut,
              duration: const Duration(milliseconds: 400),
              margin: const EdgeInsets.symmetric(vertical: 10.0),
              width: !widget.isExpanded ? widget.width * 0.4 : widget.width * 1,
              height:
                  !widget.isExpanded ? widget.width * 0.4 : widget.width * 1.2,
              onEnd: () {
                setState(() {
                  onend = widget.isExpanded;
                });
              },
              child: cards1(
                expand: onend,
                chartData: snapshot.data,
                text: widget.text,
                icon: widget.icon,
              ),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(50.0),
              child: Column(
                children: const [
                  CircularProgressIndicator(),
                  Text("Loading Block")
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
