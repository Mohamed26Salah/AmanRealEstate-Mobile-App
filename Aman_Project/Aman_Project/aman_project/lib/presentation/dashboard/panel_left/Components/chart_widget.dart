import 'dart:math';

import 'package:aman_project/models/chart_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
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
          plotAreaBorderWidth: 1,
          primaryXAxis: CategoryAxis(
            labelStyle: const TextStyle(fontSize: 10),
            majorGridLines: const MajorGridLines(width: 1),
          ),
          primaryYAxis:
              NumericAxis(majorGridLines: const MajorGridLines(width: 1)),
          tooltipBehavior: TooltipBehavior(enable: true),
          series: <ChartSeries<ChartData, String>>[
            ColumnSeries<ChartData, String>(
              dataSource: widget.dataChart,
              xValueMapper: (ChartData datax, _) => datax.x.tr,
              yValueMapper: (ChartData datay, _) => datay.y,
              name: '',
              pointColorMapper: (ChartData segment, _) {
                return returnColor(segment.x);
              },
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
