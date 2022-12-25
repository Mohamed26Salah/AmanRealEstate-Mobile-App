import 'package:aman_project/models/category_chart_data.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CategoryChart extends StatefulWidget {
  List<ChartData> DataChart;
  CategoryChart({super.key, required this.DataChart});

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
              dataSource: widget.DataChart,
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
    case "Villa":
      {
        return const Color(0xff14e4ff);
      }

    case "Flat":
      {
        return const Color(0xff14ffe9);
      }
    case "Store":
      {
        return const Color(0xff5bb85f);
      }
    case "Building":
      {
        return const Color(0xff8ec44e);
      }
    case "Clinic":
      {
        return const Color(0xffccdc37);
      }
    case "Farm":
      {
        return const Color(0xffffe714);
      }
    case "Factory":
      {
        return const Color(0xffffc414);
      }
    case "Land":
      {
        return const Color(0xffffa014);
      }
    case "Other":
      {
        return const Color(0xffff4c14);
      }
    case "admin":
      {
        return const Color.fromARGB(255, 228, 20, 255);
      }
    case "moderator":
      {
        return const Color.fromARGB(255, 255, 20, 83);
      }
    case "user":
      {
        return const Color.fromARGB(255, 255, 20, 20);
      }
    default:
      {
        return const Color.fromARGB(255, 0, 0, 0);
      }
  }
}
