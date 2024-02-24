class StudentApp {
  final String question;
  final List<String> answer;
  final String correctAnswer;

  StudentApp({
    required this.question,
    required this.answer,
    required this.correctAnswer,
  });

  factory StudentApp.fromJson(Map<String, dynamic> json) {
    final jsonAns = json['answer'] as List;

    return StudentApp(
      question: json['question'] as String? ?? '',
      answer: jsonAns.map((e) => e as String).toList(),
      correctAnswer: json['correct_answer'] as String? ?? '',
    );
  }
  Map<String, Object?> toMap() => {
        'question': question,
        'answer': answer,
        'correct_answer' : correctAnswer,
      };
}
