import 'package:aman_project/models/chart_data.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'chart_widget.dart';

class DashboardCard extends StatefulWidget {
  final String text;
  final String num;
  final int icon;
  final List<ChartData>? chartData;

  final bool expand;

  const DashboardCard({
    super.key,
    this.text = "Units",
    this.num = "0",
    this.icon = 0xf107,
    this.expand = false,
    this.chartData,
  });

  @override
  State<DashboardCard> createState() => _DashboardCardState();
}

class _DashboardCardState extends State<DashboardCard>
    with SingleTickerProviderStateMixin {
  AnimationController? expandController;
  Animation<double>? animation;

  @override
  void initState() {
    super.initState();
    prepareAnimations();
  }

  ///Setting up the animation
  void prepareAnimations() {
    expandController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));
    animation = CurvedAnimation(
      parent: expandController!,
      curve: Curves.easeInOut,
    );
  }

  @override
  void didUpdateWidget(DashboardCard oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    super.dispose();
    expandController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int count = 0;

    for (var v in widget.chartData!) {
      count = count + int.parse(v.y.toString());
    }
    return Card(
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                    textDirection: TextDirection.ltr,
                    IconData(widget.icon, fontFamily: 'MaterialIcons'),
                    color: Theme.of(context).primaryColor,
                    size: 80),
                Column(
                  children: [
                    SizedBox(
                      height: 30,
                      width: 30,
                      child: AutoSizeText(
                        minFontSize: 1,
                        count.toString(),
                        textScaleFactor: 2,
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            color: widget.expand
                                ? Theme.of(context).focusColor
                                : null),
                      ),
                    ),
                    Text(
                      textAlign: TextAlign.right,
                      textDirection: TextDirection.rtl,
                      widget.text,
                      textScaleFactor: 1,
                      style: TextStyle(
                          color: widget.expand
                              ? Theme.of(context).focusColor
                              : null),
                    ),
                  ],
                )
              ],
            ),
            Visibility(
                visible: widget.expand,
                child: CategoryChart(dataChart: widget.chartData!)),
          ],
        ));
  }
}
