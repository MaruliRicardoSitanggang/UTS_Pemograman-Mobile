import 'package:flutter/material.dart';
import '../state/quiz_scope.dart';

class ThemeToggle extends StatelessWidget {
  const ThemeToggle({super.key});
  @override
  Widget build(BuildContext context) {
    final quiz = QuizScope.of(context);
    final dark = quiz.themeMode == ThemeMode.dark;
    return IconButton(tooltip: dark ? 'Aktifkan mode terang' : 'Aktifkan mode gelap',
      onPressed: quiz.toggleTheme,
      icon: Icon(dark ? Icons.light_mode_rounded : Icons.dark_mode_outlined));
  }
}
