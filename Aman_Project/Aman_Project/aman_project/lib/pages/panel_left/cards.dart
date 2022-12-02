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
    return SizeTransition(
      axisAlignment: 1.0,
      sizeFactor: animation!,
      child: Card(
          elevation: 8,
          shadowColor: const Color.fromARGB(255, 0, 0, 0),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          color: Constants.orange,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                    stops: [0.1, 0.3],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromARGB(255, 63, 77, 120),
                      Color.fromARGB(255, 79, 10, 68),
                    ])),
            child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Icon(
                      IconData(widget.icon, fontFamily: 'MaterialIcons'),
                      size: 100,
                      color: Colors.white,
                    ),
                    Text(widget.text,
                        textScaleFactor: 2,
                        style: const TextStyle(color: Colors.white)),
                  ],
                )),
          )),
    );
  }
}
