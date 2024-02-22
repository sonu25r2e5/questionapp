class StudentApp {
  final String question;
  final List<String> answer;

  StudentApp({
    required this.question,
    required this.answer,
  });

  factory StudentApp.fromJson(Map<String, dynamic> json) {
    final jsonAns = json['answer'] as List;

    return StudentApp(
      question: json['question'] as String? ?? '',
      answer: jsonAns.map((e) => e as String).toList(),
    );
  }
  Map<String, Object?> toMap() => {
        'question': question,
        'answer': answer,
      };
}
