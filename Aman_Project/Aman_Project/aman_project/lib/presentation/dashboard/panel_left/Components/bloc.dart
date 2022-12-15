import 'package:flutter/material.dart';
import '../../../../models/category_chart_data.dart';
import 'cards.dart';

class ChartBlock extends StatefulWidget {
  final double width;
  final int index;
  bool isExpanded;
  ChartBlock(
      {super.key,
      required this.width,
      required this.index,
      this.isExpanded = false});

  @override
  State<ChartBlock> createState() => _ChartBlockState();
}

class _ChartBlockState extends State<ChartBlock> {
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
            return Text(snapshot.error.toString());
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
