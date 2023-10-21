import 'package:flutter/material.dart';
import 'package:first_app/grad_container.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: GradientContainer(
           [Color.fromARGB(255, 0, 0, 0),
          Color.fromARGB(255, 18, 18, 18),
          Color.fromRGBO(31, 31, 31, 1),
          Color.fromARGB(255, 57, 57, 57),
          ]
        ),
      ),
    ),
  );
}
