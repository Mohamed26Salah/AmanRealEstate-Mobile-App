import 'package:aman_project/models/category_chart_data.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CategoryChart extends StatefulWidget {
  const CategoryChart({super.key});

  @override
  State<CategoryChart> createState() => _CategoryChartState();
}

class _CategoryChartState extends State<CategoryChart> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ChartData>>(
      future: getData(), // function where you call your api
      builder: (BuildContext context, AsyncSnapshot<List<ChartData>> snapshot) {
        // AsyncSnapshot<Your object type>
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: Text('Please wait its loading...'));
        } else {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return Center(
                child: Container(
              padding: const EdgeInsets.all(10),
              child: SfCartesianChart(
                  primaryXAxis: CategoryAxis(
                      majorGridLines: const MajorGridLines(width: 0)),
                  primaryYAxis: NumericAxis(
                      majorGridLines: const MajorGridLines(width: 0)),
                  tooltipBehavior: TooltipBehavior(enable: true),
                  series: <ChartSeries<ChartData, String>>[
                    ColumnSeries<ChartData, String>(
                      dataSource: snapshot.data!,
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
                      animationDelay: 1300,
                    )
                  ]),
            ));
          } // snapshot.data  :- get your object which is pass from your downloadData() function
        }
      },
    );
  }
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
    case "Residential Building":
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
    default:
      {
        return const Color.fromARGB(255, 0, 0, 0);
      }
  }
}
