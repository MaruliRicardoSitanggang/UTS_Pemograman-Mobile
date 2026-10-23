import 'package:flutter/material.dart';
import '../state/quiz_scope.dart';
import '../widgets/answer_option.dart';
import '../widgets/app_card.dart';
import '../widgets/primary_button.dart';
import '../widgets/responsive_page.dart';
import '../widgets/theme_toggle.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final quiz = QuizScope.of(context);
    final theme = Theme.of(context);
    if (!quiz.started)
      return const Scaffold(
          body: Center(child: Text('Mulai sesi dari beranda.')));
    final question = quiz.current;
    final questionPanel = AppCard(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
          'SOAL ${quiz.index + 1} / ${quiz.questions.length}  •  ${question.category}',
          style: TextStyle(
              color: theme.colorScheme.primary, fontWeight: FontWeight.w600)),
      const SizedBox(height: 20),
      Text(question.text,
          style: theme.textTheme.headlineSmall
              ?.copyWith(fontWeight: FontWeight.w700)),
      const SizedBox(height: 12),
      const Text('Pilih satu jawaban yang paling tepat.'),
      const SizedBox(height: 24),
      for (var i = 0; i < question.options.length; i++)
        AnswerOption(
            index: i,
            text: question.options[i],
            selected: quiz.answerAt(quiz.index) == i,
            onTap: () => quiz.selectAnswer(i)),
      const SizedBox(height: 16),
      Wrap(spacing: 12, runSpacing: 12, children: [
        OutlinedButton.icon(
            onPressed: quiz.index > 0 ? () => quiz.goTo(quiz.index - 1) : null,
            icon: const Icon(Icons.arrow_back),
            label: const Text('Sebelumnya')),
        FilledButton.icon(
            onPressed: quiz.index < quiz.questions.length - 1
                ? () => quiz.goTo(quiz.index + 1)
                : null,
            icon: const Icon(Icons.arrow_forward),
            label: const Text('Berikutnya')),
      ]),
    ]));
    final navigation = AppCard(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text('Halo, ${quiz.name}',
          style: theme.textTheme.titleLarge
              ?.copyWith(fontWeight: FontWeight.w700)),
      const SizedBox(height: 8),
      Text('${quiz.answeredCount} dari ${quiz.questions.length} soal terjawab'),
      const SizedBox(height: 12),
      Semantics(
          label: 'Progres jawaban',
          value: '${quiz.answeredCount} dari ${quiz.questions.length}',
          child: LinearProgressIndicator(
              value: quiz.progress,
              minHeight: 8,
              borderRadius: BorderRadius.circular(12))),
      const SizedBox(height: 24),
      const Text('Peta soal', style: TextStyle(fontWeight: FontWeight.w700)),
      const SizedBox(height: 12),
      Wrap(
          spacing: 8,
          runSpacing: 8,
          children: List.generate(quiz.questions.length, (i) {
            final answered = quiz.answerAt(i) != null;
            return Tooltip(
                message:
                    'Soal ${i + 1}, ${answered ? "terjawab" : "belum terjawab"}',
                child: ChoiceChip(
                    label: Text('${i + 1}${answered ? " ✓" : ""}'),
                    selected: quiz.index == i,
                    onSelected: (_) => quiz.goTo(i)));
          })),
      const SizedBox(height: 24),
      Text(quiz.allAnswered
          ? 'Semua soal terisi. Periksa kembali atau selesaikan kuis.'
          : 'Jawab semua soal untuk membuka hasil akhir.'),
      const SizedBox(height: 16),
      PrimaryButton(
          label: 'Selesaikan kuis',
          icon: Icons.flag_rounded,
          onPressed: quiz.allAnswered
              ? () async {
                  final confirmed = await showDialog<bool>(
                      context: context,
                      builder: (context) => AlertDialog(
                              title: const Text('Kumpulkan jawaban?'),
                              content: const Text(
                                  'Setelah selesai, jawaban tidak dapat diubah. Kamu dapat mencoba lagi pada sesi baru.'),
                              actions: [
                                TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, false),
                                    child: const Text('Periksa lagi')),
                                FilledButton(
                                    onPressed: () =>
                                        Navigator.pop(context, true),
                                    child: const Text('Selesai'))
                              ]));
                  if (!context.mounted || confirmed != true) return;
                  if (quiz.finish())
                    Navigator.pushReplacementNamed(context, '/result');
                }
              : null),
      const SizedBox(height: 8),
      TextButton.icon(
          onPressed: () =>
              Navigator.popUntil(context, (route) => route.isFirst),
          icon: const Icon(Icons.home_outlined),
          label: const Text('Simpan sesi & ke beranda')),
    ]));
    return Scaffold(
        appBar: AppBar(
            title: const Text('Kuis Flutter'), actions: const [ThemeToggle()]),
        body: SafeArea(
            child: ResponsivePage(
                builder: (context, wide) => wide
                    ? Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            Expanded(flex: 3, child: questionPanel),
                            const SizedBox(width: 24),
                            Expanded(flex: 2, child: navigation)
                          ])
                    : Column(children: [
                        questionPanel,
                        const SizedBox(height: 20),
                        navigation
                      ]))));
  }
}
