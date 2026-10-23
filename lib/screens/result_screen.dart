import 'package:flutter/material.dart';
import '../state/quiz_scope.dart';
import '../widgets/app_card.dart';
import '../widgets/primary_button.dart';
import '../widgets/responsive_page.dart';
import '../widgets/stat_chip.dart';
import '../widgets/theme_toggle.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final quiz = QuizScope.of(context);
    final theme = Theme.of(context);
    if (!quiz.finished)
      return const Scaffold(
          body: Center(child: Text('Selesaikan kuis terlebih dahulu.')));
    return Scaffold(
        appBar: AppBar(
            title: const Text('Hasil kuis'), actions: const [ThemeToggle()]),
        body: SafeArea(
            child: ResponsivePage(
                builder: (context, wide) => Center(
                      child: ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 620),
                          child: AppCard(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Icon(Icons.emoji_events_rounded,
                                      color: theme.colorScheme.primary,
                                      size: (MediaQuery.sizeOf(context)
                                                  .shortestSide *
                                              .18)
                                          .clamp(56.0, 90.0)),
                                  const SizedBox(height: 20),
                                  Text('Kuis selesai, ${quiz.name}!',
                                      textAlign: TextAlign.center,
                                      style: theme.textTheme.headlineSmall
                                          ?.copyWith(
                                              fontWeight: FontWeight.w700)),
                                  const SizedBox(height: 12),
                                  Text(
                                      quiz.score >= 80
                                          ? 'Keren! Dasar Flutter-mu sudah kuat.'
                                          : quiz.score >= 60
                                              ? 'Bagus! Terus latih pemahamanmu.'
                                              : 'Tetap semangat. Yuk, pelajari pembahasannya.',
                                      textAlign: TextAlign.center),
                                  const SizedBox(height: 28),
                                  Text('${quiz.score}',
                                      textAlign: TextAlign.center,
                                      style: theme.textTheme.displayLarge
                                          ?.copyWith(
                                              fontWeight: FontWeight.w700,
                                              color:
                                                  theme.colorScheme.primary)),
                                  const Text('dari 100 poin',
                                      textAlign: TextAlign.center),
                                  const SizedBox(height: 24),
                                  Wrap(
                                      alignment: WrapAlignment.center,
                                      spacing: 8,
                                      runSpacing: 8,
                                      children: [
                                        StatChip(
                                            icon: Icons.check_circle_outline,
                                            text: '${quiz.correctCount} benar'),
                                        StatChip(
                                            icon: Icons.cancel_outlined,
                                            text:
                                                '${quiz.questions.length - quiz.correctCount} salah'),
                                      ]),
                                  const SizedBox(height: 28),
                                  PrimaryButton(
                                      label: 'Lihat pembahasan',
                                      icon: Icons.menu_book_rounded,
                                      onPressed: () => Navigator.pushNamed(
                                          context, '/review')),
                                  const SizedBox(height: 12),
                                  OutlinedButton.icon(
                                      onPressed: () {
                                        quiz.start(quiz.name);
                                        Navigator.pushReplacementNamed(
                                            context, '/quiz');
                                      },
                                      icon: const Icon(Icons.replay_rounded),
                                      label: const Text('Coba lagi')),
                                  const SizedBox(height: 8),
                                  TextButton(
                                      onPressed: () => Navigator.popUntil(
                                          context, (route) => route.isFirst),
                                      child: const Text('Kembali ke beranda')),
                                ]),
                          )),
                    ))));
  }
}
