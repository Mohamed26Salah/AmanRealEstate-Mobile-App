import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LoadingAnimationWidget.dotsTriangle(
      color: Theme.of(context).primaryColor,
      size: (MediaQuery.of(context).size.longestSide -
              MediaQuery.of(context).size.shortestSide) /
          3,
    );
  }
}
