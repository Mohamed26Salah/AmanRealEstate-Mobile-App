// ignore: unused_import

import 'package:aman_project/constants.dart';
import 'package:aman_project/models/category_chart_data.dart';
import 'package:flutter/material.dart';

import 'chart_widget.dart';

class cards1 extends StatefulWidget {
  final String text;
  final String num;
  final int icon;

  final bool expand;

  const cards1({
    super.key,
    this.text = "Units",
    this.num = "0",
    this.icon = 0xf107,
    this.expand = false,
  });

  @override
  State<cards1> createState() => _cards1State();
}

class _cards1State extends State<cards1> with SingleTickerProviderStateMixin {
  AnimationController? expandController;
  Animation<double>? animation;

  @override
  void initState() {
    super.initState();
    prepareAnimations();
    _runExpandCheck();
  }

  ///Setting up the animation
  void prepareAnimations() {
    expandController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    animation = CurvedAnimation(
      parent: expandController!,
      curve: Curves.fastOutSlowIn,
    );
  }

  void _runExpandCheck() {
    if (widget.expand) {
      expandController!.forward();
    } else {
      expandController!.reverse();
    }
  }

  @override
  void didUpdateWidget(cards1 oldWidget) {
    super.didUpdateWidget(oldWidget);
    _runExpandCheck();
  }

  @override
  void dispose() {
    expandController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int count = 0;
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
            snapshot.data!
                .forEach((v) => count = count + int.parse(v.y.toString()));
            return Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                                textDirection: TextDirection.ltr,
                                IconData(widget.icon,
                                    fontFamily: 'MaterialIcons'),
                                color: Theme.of(context).primaryColor,
                                size: 50),
                            Column(
                              children: [
                                Text(
                                  count.toString(),
                                  textScaleFactor: 2.5,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      color: widget.expand
                                          ? Theme.of(context).focusColor
                                          : null),
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
                        SizeTransition(
                            axisAlignment: 1.0,
                            sizeFactor: animation!,
                            child: Visibility(
                                visible: widget.expand,
                                child:
                                    CategoryChart(DataChart: snapshot.data!))),
                      ],
                    )));
          }
        }
      },
    );
  }
}
