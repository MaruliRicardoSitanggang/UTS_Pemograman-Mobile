import 'package:flutter/material.dart';
import '../data/question_bank.dart';
import '../models/question.dart';

/// Hidup di atas Navigator, jadi tidak ikut dibuang ketika berpindah route.
/// Data bersifat lokal dalam memori; menutup paksa aplikasi memulai sesi baru.
class QuizController extends ChangeNotifier {
  QuizController({List<Question> questions = questionBank})
      : questions = List.unmodifiable(questions) {
    if (questions.isEmpty) throw ArgumentError('Bank soal tidak boleh kosong.');
    if (questions.any((q) =>
        q.options.length != 4 ||
        q.correctIndex < 0 ||
        q.correctIndex >= q.options.length)) {
      throw ArgumentError(
          'Setiap soal harus memiliki 4 opsi dan satu indeks jawaban yang valid.');
    }
    _answers = List<int?>.filled(questions.length, null);
  }
  final List<Question> questions;
  late List<int?> _answers;
  String _name = '';
  int _index = 0;
  bool _started = false;
  bool _finished = false;
  ThemeMode _themeMode = ThemeMode.light;

  String get name => _name;
  int get index => _index;
  bool get started => _started;
  bool get finished => _finished;
  ThemeMode get themeMode => _themeMode;
  Question get current => questions[_index];
  List<int?> get answers => List.unmodifiable(_answers);
  int? answerAt(int index) => _answers[index];
  int get answeredCount => _answers.whereType<int>().length;
  bool get allAnswered => answeredCount == questions.length;
  double get progress => answeredCount / questions.length;
  int get correctCount => List.generate(
          questions.length, (i) => _answers[i] == questions[i].correctIndex)
      .where((v) => v)
      .length;
  int get score => (100 * correctCount / questions.length).round();

  void start(String name) {
    final clean = name.trim();
    if (clean.isEmpty || clean.length > 40)
      throw ArgumentError('Nama harus 1–40 karakter.');
    _name = clean;
    _answers = List<int?>.filled(questions.length, null);
    _index = 0;
    _started = true;
    _finished = false;
    notifyListeners();
  }

  void selectAnswer(int answer) {
    if (!_started || _finished) return;
    if (answer < 0 || answer >= current.options.length)
      throw RangeError.index(answer, current.options);
    _answers[_index] = answer;
    notifyListeners();
  }

  void goTo(int index) {
    if (!_started || index < 0 || index >= questions.length) return;
    _index = index;
    notifyListeners();
  }

  bool finish() {
    if (!_started || !allAnswered) return false;
    _finished = true;
    notifyListeners();
    return true;
  }

  void toggleTheme() {
    _themeMode =
        _themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
  }
}
