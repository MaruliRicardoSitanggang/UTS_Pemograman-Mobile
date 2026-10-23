import 'package:flutter_test/flutter_test.dart';
import 'package:quizora/state/quiz_controller.dart';

void main() {
  test('validasi nama, progres, penggantian jawaban dan skor', () {
    final quiz = QuizController();
    addTearDown(quiz.dispose);
    expect(() => quiz.start('  '), throwsArgumentError);
    quiz.start('  Maruli  ');
    expect(quiz.name, 'Maruli');
    expect(quiz.finish(), isFalse);
    quiz.selectAnswer(0);
    quiz.selectAnswer(quiz.current.correctIndex);
    expect(quiz.answeredCount, 1);
    for (var i = 1; i < quiz.questions.length; i++) {
      quiz.goTo(i);
      quiz.selectAnswer(quiz.current.correctIndex);
    }
    expect(quiz.progress, 1);
    expect(quiz.finish(), isTrue);
    expect(quiz.score, 100);
    final previous = quiz.answerAt(9);
    quiz.selectAnswer(0);
    expect(quiz.answerAt(9), previous);
    quiz.start('Ulang');
    expect(quiz.answeredCount, 0);
    expect(quiz.finished, isFalse);
    expect(quiz.index, 0);
  });
  test('seluruh jawaban salah menghasilkan nol', () {
    final quiz = QuizController();
    addTearDown(quiz.dispose);
    quiz.start('Tes');
    for (var i = 0; i < quiz.questions.length; i++) {
      quiz.goTo(i);
      quiz.selectAnswer((quiz.current.correctIndex + 1) % 4);
    }
    quiz.finish();
    expect(quiz.score, 0);
    expect(quiz.correctCount, 0);
  });
}
