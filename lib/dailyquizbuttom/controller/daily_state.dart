import 'package:studentapp/dailyquizbuttom/restapi.dart';

class DailyState {
  final List<StudentApp> questions;
  final List<String?> userAnswers;
  final int score;
  final int currentQuestion;

  const DailyState( {required this.questions, required this.score,
  required this.currentQuestion,
  required this.userAnswers,
  });


  factory DailyState.initial() => const DailyState(questions: [], score: 0,currentQuestion: 0,
  userAnswers: [],);

  DailyState copyWith({
    List<StudentApp>? questions,
    List<String?>? userAnswers,
    int? score,
    int? currentQuestion,
  }) {
    return DailyState(
    questions:   questions ?? this.questions,
     score: score ?? this.score,
     currentQuestion: currentQuestion ?? this.currentQuestion,
     userAnswers: userAnswers ?? this.userAnswers,
    );
  }

  String? get currentQuestionAnswer =>  userAnswers[currentQuestion];

  bool get hasChoosenCurrentAnswer => currentQuestionAnswer != null;

  int get currentChoosenAnswerIndex => questions[currentQuestion].answer.indexWhere((e) => e == currentQuestionAnswer);

}
