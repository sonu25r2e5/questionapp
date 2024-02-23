class StudentApp {
  final String question;
  final List<String> answer;
  final String correct_answer;

  StudentApp({
    required this.question,
    required this.answer,
    required this.correct_answer,
  });

  factory StudentApp.fromJson(Map<String, dynamic> json) {
    final jsonAns = json['answer'] as List;

    return StudentApp(
      question: json['question'] as String? ?? '',
      answer: jsonAns.map((e) => e as String).toList(),
      correct_answer: json['correct_answer'] as String? ?? '',
    );
  }
  Map<String, Object?> toMap() => {
        'question': question,
        'answer': answer,
        'correct_answer' : correct_answer,
      };
}
