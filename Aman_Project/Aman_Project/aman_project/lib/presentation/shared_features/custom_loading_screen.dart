import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:lottie/lottie.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      child: LottieBuilder.asset(
        "assets/Animations/Comp 1.json",
      ),
    );
    return LoadingAnimationWidget.dotsTriangle(
      color: const Color.fromARGB(255, 205, 153, 51),
      size: 70,
    );
  }
}
