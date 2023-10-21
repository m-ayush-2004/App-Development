import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/question_summary.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen({super.key, required this.chosenAnswers, required this.restart});
  final List<String> chosenAnswers;
  void Function() restart;
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (int i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'index': i,
        'question': questions[i].text,
        'chosen_answer': chosenAnswers[i],
        'correct_answer': questions[i].answers[0],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final totQues = questions.length;
    final corrQues = summaryData.where((data) {
      return data['correct_answer'] == data['chosen_answer'];
    }).length;
    return SizedBox(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        height: double.maxFinite,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'you answered $corrQues correct out of $totQues questions correctly',
                style: const TextStyle(color: Colors.white, fontSize: 17),
              ),
              const SizedBox(
                height: 30,
              ),
              QuestionsSummary(summaryData: getSummaryData()),
              const SizedBox(
                height: 30,
              ),
              TextButton.icon(
                  onPressed: restart,
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Color.fromARGB(255, 180, 22, 22),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                  icon: const Icon(Icons.restart_alt),
                  label: const Text(
                    'Restart Quiz!',
                    style: TextStyle(fontSize: 18),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
