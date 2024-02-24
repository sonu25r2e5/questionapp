import 'package:get/state_manager.dart';
import 'package:studentapp/dailyquizbuttom/controller/daily_state.dart';
import 'package:studentapp/services/my_database.dart';

class DailyController extends GetxController with StateMixin<DailyState> {

  @override
  void onInit() {
    super.onInit();
    change(DailyState.initial(), status: RxStatus.loading());
  }

  @override
  void onReady() {
    super.onReady();
    loadQuestions();
  }

  Future<void> loadQuestions() async {
    final response = await MyDatabase.instance.questionsFuture;
    final questions = response.docs.map((e) => e.data()).toList();

    change(
      state?.copyWith(
        questions: [...questions],
        userAnswers: questions.map((e) => null).toList(),
      ),
      status: RxStatus.success(),
    );
  }

  void nextQuestion() {
    final next = state!.currentQuestion + 1;
    change(
      state?.copyWith(currentQuestion: next),
      status: RxStatus.success(),
    );
  }

  void chooseAnswer( String answer){
    final newUserAnswers = [...state!.userAnswers];
    newUserAnswers[state!.currentQuestion] = answer;
    var newScore = state!.score;
    if(answer == state!.questions[state!.currentQuestion].correctAnswer){
      newScore += 10;
    }
    change(
      state?.copyWith(userAnswers: [...newUserAnswers], score: newScore),
      status: RxStatus.success(),
    );
  }
RxInt score = 0.obs;


void point(int score) {
  score++;
}


}
