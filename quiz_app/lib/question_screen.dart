import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({
    super.key,
    required this.onSelectAnswer,
  });

  final void Function(String) onSelectAnswer;

  @override
  State<QuestionScreen> createState() {
    return _QuestionScreen();
  }
}

class _QuestionScreen extends State<QuestionScreen> {
  var currentQuestion = 0;

  void ansSelect( String answer) {
    widget.onSelectAnswer(answer);
    setState(() {
      currentQuestion++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              questions[currentQuestion].text,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 255, 238, 238),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ...questions[currentQuestion].getShuffledAnswers().map(
              (item) {
                return AnswerButton(
                  answerText: item,
                  onTap: () {
                    ansSelect(item);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
