class QuestionModel {
  final String question;
  final List<Map<String, dynamic>> options;
  final int correctAnswerIndex;
  bool isSelected;

  QuestionModel({
    required this.question,
    required this.options,
    required this.correctAnswerIndex,
    required this.isSelected,
  });
}


