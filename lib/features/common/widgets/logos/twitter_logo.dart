import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class TwitterLogo extends StatelessWidget {
  const TwitterLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return LottieBuilder.asset(
      "assets/lotties/twitter_lottie.json",
      width: 50,
      height: 50,
    );
  }
}
