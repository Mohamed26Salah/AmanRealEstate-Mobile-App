import 'dart:math';

import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:lottie/lottie.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController ctrl;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ctrl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 900));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: max(MediaQuery.of(context).size.shortestSide, 70),
      child: LottieBuilder.asset(
        "assets/Animations/Comp 1.json",
        controller: ctrl,
        onLoaded: (p0) {
          ctrl.forward();
        },
      ),
    );
    return LoadingAnimationWidget.dotsTriangle(
      color: const Color.fromARGB(255, 205, 153, 51),
      size: 70,
    );
  }
}
