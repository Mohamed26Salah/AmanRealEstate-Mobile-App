// ignore: unused_import

import 'package:aman_project/constants.dart';
import 'package:flutter/material.dart';

class cards1 extends StatefulWidget {
  final String text;
  final String num;
  final int icon;
  final Widget? child;
  final bool expand;

  const cards1(
      {super.key,
      this.text = "Units",
      this.num = "0",
      this.icon = 0xf107,
      this.expand = false,
      this.child});

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
    return Card(
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                        textDirection: TextDirection.ltr,
                        IconData(widget.icon, fontFamily: 'MaterialIcons'),
                        color: Theme.of(context).primaryColor,
                        size: 50),
                    Column(
                      children: [
                        Text(
                          "200",
                          textScaleFactor: 1.5,
                        ),
                        Text(
                          textAlign: TextAlign.right,
                          textDirection: TextDirection.rtl,
                          widget.text,
                          textScaleFactor: 1,
                        ),
                      ],
                    )
                  ],
                ),
                SizeTransition(
                    axisAlignment: 1.0,
                    sizeFactor: animation!,
                    child: widget.child),
              ],
            )));
  }
}
