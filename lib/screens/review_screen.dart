import 'package:flutter/material.dart';
import '../state/quiz_scope.dart';
import '../widgets/app_card.dart';
import '../widgets/responsive_page.dart';
import '../widgets/theme_toggle.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final quiz = QuizScope.of(context);
    final theme = Theme.of(context);
    return Scaffold(appBar: AppBar(title: const Text('Pembahasan'), actions: const [ThemeToggle()]),
      body: SafeArea(child: ResponsivePage(builder: (context, wide) => !quiz.finished
        ? const Text('Pembahasan tersedia setelah kuis selesai.')
        : Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Text('Belajar dari setiap jawaban', style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w700)),
          const SizedBox(height: 8), Text('${quiz.name} • ${quiz.correctCount}/${quiz.questions.length} jawaban benar'),
          const SizedBox(height: 24),
          for (var i = 0; i < quiz.questions.length; i++) Padding(padding: const EdgeInsets.only(bottom: 16),
            child: AppCard(child: Builder(builder: (context) {
              final question = quiz.questions[i];
              final answer = quiz.answerAt(i);
              final correct = answer == question.correctIndex;
              return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(children: [Icon(correct ? Icons.check_circle : Icons.cancel,
                    color: correct ? (theme.brightness == Brightness.dark ? const Color(0xFF81C9A4) : const Color(0xFF23764B)) : theme.colorScheme.error),
                  const SizedBox(width: 8), Text('Soal ${i + 1} • ${correct ? "Benar" : "Salah"}', style: const TextStyle(fontWeight: FontWeight.w700))]),
                const SizedBox(height: 12), Text(question.text, style: theme.textTheme.titleMedium),
                const SizedBox(height: 12),
                Text('Jawabanmu: ${answer == null ? "Belum dijawab" : question.options[answer]}'),
                const SizedBox(height: 6),
                Text('Jawaban benar: ${question.options[question.correctIndex]}', style: const TextStyle(fontWeight: FontWeight.w600)),
                const SizedBox(height: 12), Text(question.explanation),
              ]);
            }))),
        ]))));
  }
}
