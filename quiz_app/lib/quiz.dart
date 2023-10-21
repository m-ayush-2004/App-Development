import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/question_screen.dart';
import 'package:quiz_app/results_screen.dart';
import 'package:quiz_app/start_screen.dart';

class QuizState extends StatefulWidget {
  const QuizState({super.key});

  @override
  State<QuizState> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<QuizState> {
  // method 1
  // Widget? activeScreen;

  // @override
  // void initState() {
  //   activeScreen = StartScreen(switchScreen);
  //   super.initState();
  // }
  // Widget activeScreen = StartScreen(() {});
  // void switchScreen() {
  //   setState(() {
  //     activeScreen = const QuestionScreen();
  //   });
  // }

  Widget? screenWidget;
  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';
  // var activeScreen = 'result-screen';
  void switchScreen() {
    setState(() {
      activeScreen = 'quiz-screen';
    });
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'start-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length >= questions.length) {
      setState(() {
        // selectedAnswers = [];
        activeScreen = 'result-screen';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (activeScreen == 'start-screen') {
      screenWidget = StartScreen(switchScreen);
    } else if (activeScreen == 'result-screen') {
      screenWidget = ResultScreen(
        chosenAnswers: selectedAnswers,
        restart: restartQuiz,
      );
    } else {
      screenWidget = QuestionScreen(
        onSelectAnswer: chooseAnswer,
      );
    }
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 252, 24, 24),
            Color.fromARGB(255, 253, 81, 81),
            Color.fromARGB(255, 253, 129, 27),
            Color.fromARGB(255, 249, 151, 82),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      // child: activeScreen,
      child: screenWidget,
    );
  }
}
