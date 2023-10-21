import 'package:flutter/material.dart';
import "dart:math";

class RollDice extends StatefulWidget {
  const RollDice({super.key});
  @override
  State<RollDice> createState() {
    return _RollDiceState();
  }
}

class _RollDiceState extends State<RollDice> {
  Random rand = Random();
  var image = 2;
  void rollDice() {
    setState(() {
      image = rand.nextInt(6) + 1;
    });
  }

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/dice-six-faces-$image.png',
          width: 180,
        ),
        const SizedBox(height: 30),
        TextButton(
          onPressed: rollDice,
          style: TextButton.styleFrom(
            foregroundColor: const Color.fromARGB(255, 255, 255, 255),
            textStyle: const TextStyle(
              fontSize: 28,
            ),
          ),
          child: const Text('Roll Dice'),
        ),
      ],
    );
  }
}
