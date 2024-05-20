
class Question {
  final String questionText;
  final List<String> options;
  final String correctAnswer;

  Question({
    required this.questionText,
    required this.options,
    required this.correctAnswer,
  });
}

String getProgress(List<Question> questions, int currentQuestionIndex) {
  return '${currentQuestionIndex + 1}/${questions.length}';
}