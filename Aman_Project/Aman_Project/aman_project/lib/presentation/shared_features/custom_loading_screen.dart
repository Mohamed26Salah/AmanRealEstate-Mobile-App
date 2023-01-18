import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LoadingAnimationWidget.dotsTriangle(
      color: const Color.fromARGB(255, 205, 153, 51),
      size: MediaQuery.of(context).size.shortestSide - 295,
    );
  }
}
