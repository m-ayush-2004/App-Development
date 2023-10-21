class QuizQuestion {
  const QuizQuestion(this.text, this.answers);
  final String text;
  final List<String> answers;
  List<String> getShuffledAnswers() {
    final lst = List.of(answers);
    lst.shuffle();
    return lst;
  }
}
