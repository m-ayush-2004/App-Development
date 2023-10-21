import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({super.key, required this.summaryData});
  final List<Map<String, Object>> summaryData;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: summaryData.map(
            (data) {
              bool isCorrect =
                  (data['correct_answer'] == data['chosen_answer']);
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: isCorrect
                          ? Color.fromARGB(255, 191, 255, 156)
                          : Color.fromARGB(255, 255, 151, 151),
                    ),
                    child: Text(
                      ((data['index'] as int) + 1).toString(),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(
                        left: 15,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data['question'] as String,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            data['chosen_answer'] as String,
                            style: const TextStyle(
                              color: Color.fromARGB(255, 255, 197, 197),
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.start,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            data['correct_answer'] as String,
                            style: const TextStyle(
                              color: Color.fromARGB(255, 193, 255, 199),
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.start,
                          ),
                          const SizedBox(height: 25)
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
