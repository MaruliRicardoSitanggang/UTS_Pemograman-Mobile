import 'package:flutter/material.dart';
import 'core/app_theme.dart';
import 'screens/home_screen.dart';
import 'screens/quiz_screen.dart';
import 'screens/result_screen.dart';
import 'screens/review_screen.dart';
import 'state/quiz_controller.dart';
import 'state/quiz_scope.dart';

class QuizoraApp extends StatefulWidget {
  const QuizoraApp({super.key});
  @override
  State<QuizoraApp> createState() => _QuizoraAppState();
}

class _QuizoraAppState extends State<QuizoraApp> {
  // Dibuat sekali, bukan di build(): rebuild saat rotasi tidak mereset jawaban.
  late final QuizController _controller;
  @override
  void initState() {
    super.initState();
    _controller = QuizController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => QuizScope(
      controller: _controller,
      child: ListenableBuilder(
          listenable: _controller,
          builder: (context, child) => MaterialApp(
                title: 'Quizora',
                debugShowCheckedModeBanner: false,
                theme: AppTheme.build(Brightness.light),
                darkTheme: AppTheme.build(Brightness.dark),
                themeMode: _controller.themeMode,
                routes: {
                  '/': (context) => const HomeScreen(),
                  '/quiz': (context) => const QuizScreen(),
                  '/result': (context) => const ResultScreen(),
                  '/review': (context) => const ReviewScreen(),
                },
              )));
}
