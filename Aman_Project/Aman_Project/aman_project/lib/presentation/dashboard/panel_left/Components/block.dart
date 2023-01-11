import 'package:aman_project/data/property_managemnt.dart';
import 'package:aman_project/data/rents_management.dart';
import 'package:aman_project/data/user_management.dart';
import 'package:flutter/material.dart';
import '../../../../models/chart_data.dart';
import '../../../shared_features/custom_loading_screen.dart';
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
      this.icon = 0xf7f5,
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
      chartData = PropertyManagement.getPropertiesType();
    } else if (widget.dataNum == 1) {
      chartData = UserHelper.getUsersRoles();
    } else if (widget.dataNum == 2) {
      chartData = RentsManagement.getRentsType();
    } else {
      chartData = PropertyManagement.getPropertiesType();
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
              width: widget.width,
              height:
                  !widget.isExpanded ? widget.width * 0.4 : widget.width * 1.2,
              onEnd: () {
                setState(() {
                  onend = widget.isExpanded;
                });
              },
              child: Cards1(
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
                  Center(
                    child: LoadingScreen(),
                  ),
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
