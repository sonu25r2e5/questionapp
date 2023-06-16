import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieScreen2 extends StatefulWidget {
  const LottieScreen2({super.key});

  @override
  State<LottieScreen2> createState() => _LottieScreen2State();
}

class _LottieScreen2State extends State<LottieScreen2> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
          padding: const EdgeInsets.all(25),
          child: LottieBuilder.asset("assets/ase.json")),
    );
  }
}
