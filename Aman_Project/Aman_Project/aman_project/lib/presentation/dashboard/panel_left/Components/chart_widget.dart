import 'dart:math';

import 'package:aman_project/models/chart_data.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CategoryChart extends StatefulWidget {
  List<ChartData> dataChart;
  CategoryChart({super.key, required this.dataChart});

  @override
  State<CategoryChart> createState() => _CategoryChartState();
}

class _CategoryChartState extends State<CategoryChart> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SfCartesianChart(
          primaryXAxis:
              CategoryAxis(majorGridLines: const MajorGridLines(width: 0)),
          primaryYAxis:
              NumericAxis(majorGridLines: const MajorGridLines(width: 0)),
          tooltipBehavior: TooltipBehavior(enable: true),
          series: <ChartSeries<ChartData, String>>[
            ColumnSeries<ChartData, String>(
              dataSource: widget.dataChart,
              xValueMapper: (ChartData datax, _) => datax.x,
              yValueMapper: (ChartData datay, _) => datay.y,
              name: 'Number of Units',
              pointColorMapper: (ChartData segment, _) {
                return returnColor(segment.x);
              },
              // gradient: const LinearGradient(
              //   colors: [Color(0xffffc414), Color(0xff14ffe9)],
              //   begin: Alignment.bottomLeft,
              //   end: Alignment.topRight,
              // ),
              borderRadius: BorderRadius.circular(10),
            )
          ]),
    );
  } // snapshot.data  :- get your object which is pass from your downloadData() function

}

Color? returnColor(String? s) {
  switch (s) {
    default:
      {
        return Color.fromARGB(255, Random().nextInt(255), Random().nextInt(255),
            Random().nextInt(255));
      }
  }
}
