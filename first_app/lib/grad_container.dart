import 'package:flutter/material.dart';
import 'package:first_app/roll.dart';

const startGrad = Alignment.topLeft;
const endGrad = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
  const GradientContainer(this.cols, {super.key});
  void rollDice() {
    // ...
  }

  final List<Color> cols;
  @override
  Widget build(context) {
    return Container(
        decoration: BoxDecoration(
            gradient:
                LinearGradient(colors: cols, begin: startGrad, end: endGrad)),
        child: const Center(
            child: RollDice()
            ));
  }
}
