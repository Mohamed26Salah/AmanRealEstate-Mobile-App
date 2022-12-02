import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

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
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          //changing the current expandableState
          widget.isExpanded = !widget.isExpanded;
        });
      },
      child: AnimatedContainer(
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 400),
        margin: const EdgeInsets.all(10.0),
        width: !widget.isExpanded ? widget.width * 0.4 : widget.width * 1,
        height: !widget.isExpanded ? widget.width * 0.4 : widget.width * 1.5,
        child: cards1(
          expand: widget.isExpanded,
          child: Visibility(visible: widget.isExpanded, child: CategoryChart()),
        ),
      ),
    );
  }
}
