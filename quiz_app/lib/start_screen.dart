import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.switchScreen, {super.key});
  final void Function() switchScreen;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            "assets/images/quiz-logo.png",
            width: 300,
            color: const Color.fromARGB(150, 255, 255, 255),
            // opacity: Opacity(opacity),
          ),
          const SizedBox(height: 40),
          Text(
            'Welcome to Flutter Quiz App!',
            style: GoogleFonts.lato(
              fontSize: 20,
              color: const Color.fromARGB(255, 255, 223, 223),
            ),
          ),
          const SizedBox(height: 40),
          OutlinedButton.icon(
            onPressed: switchScreen,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            label: const Text(
              'Start Quiz!',
            ),
            icon: const Icon(Icons.arrow_right_alt),
          )
        ],
      ),
    );
  }
}
