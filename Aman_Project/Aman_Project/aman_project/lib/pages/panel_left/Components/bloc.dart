import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../models/category_chart_data.dart';
import 'cards.dart';
import 'chart_widget.dart';

class bloc extends StatefulWidget {
  double width;
  int index;
  bool isExpanded = false;
  bloc(
      {super.key,
      required this.width,
      required this.index,
      this.isExpanded = false});

  @override
  State<bloc> createState() => _blocState();
}

class _blocState extends State<bloc> {
  Future<List<ChartData>>? chartData;
  @override
  void initState() {
    super.initState();
    chartData = getData();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          //changing the current expandableState
          widget.isExpanded = !widget.isExpanded;
        });
      },
      child: FutureBuilder(
        future: chartData,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text("error loading data");
          } else if (snapshot.hasData) {
            return AnimatedContainer(
              curve: Curves.easeInOut,
              duration: const Duration(milliseconds: 400),
              margin: const EdgeInsets.all(10.0),
              width: !widget.isExpanded ? widget.width * 0.4 : widget.width * 1,
              height:
                  !widget.isExpanded ? widget.width * 0.4 : widget.width * 1.2,
              child: cards1(
                expand: widget.isExpanded,
                chartData: snapshot.data,
              ),
            );
          } else {
            return const Text("Loading");
          }
        },
      ),
    );
  }
}
