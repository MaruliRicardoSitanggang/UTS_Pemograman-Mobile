import 'package:flutter/material.dart';
import '../state/quiz_scope.dart';
import '../widgets/app_card.dart';
import '../widgets/primary_button.dart';
import '../widgets/responsive_page.dart';
import '../widgets/stat_chip.dart';
import '../widgets/theme_toggle.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  @override
  void dispose() { _nameController.dispose(); super.dispose(); }

  void _start() {
    if (!_formKey.currentState!.validate()) return;
    QuizScope.of(context).start(_nameController.text);
    FocusScope.of(context).unfocus();
    Navigator.pushNamed(context, '/quiz');
  }
  @override
  Widget build(BuildContext context) {
    final quiz = QuizScope.of(context);
    final theme = Theme.of(context);
    final hero = Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text('BELAJAR • COBA • BERTUMBUH', style: TextStyle(fontWeight: FontWeight.w600, letterSpacing: 1.3)),
      const SizedBox(height: 20),
      Text('Satu kuis.\nSelangkah lebih tahu.', style: theme.textTheme.displaySmall?.copyWith(fontWeight: FontWeight.w700)),
      const SizedBox(height: 16),
      Text('Uji pemahaman Flutter-mu lewat 10 pertanyaan singkat. Pilih jawaban, lihat hasil, lalu pelajari pembahasannya.',
        style: theme.textTheme.bodyLarge),
      const SizedBox(height: 20),
      Wrap(spacing: 8, runSpacing: 4, children: [
        StatChip(icon: Icons.quiz_outlined, text: '${quiz.questions.length} soal'),
        const StatChip(icon: Icons.timer_outlined, text: 'Tanpa batas waktu'),
        const StatChip(icon: Icons.wifi_off_rounded, text: 'Bisa offline'),
      ]),
      const SizedBox(height: 24),
      Center(child: FractionallySizedBox(widthFactor: .55,
        child: Image.asset('assets/images/quizora_mark.png', semanticLabel: 'Logo Quizora berupa huruf Q'))),
    ]);
    final form = AppCard(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text('Siap mulai?', style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w700)),
      const SizedBox(height: 8),
      const Text('Masukkan namamu. Nama ini akan ditampilkan bersama skor akhir.'),
      const SizedBox(height: 24),
      Form(key: _formKey, child: TextFormField(controller: _nameController,
        key: const Key('name_field'), maxLength: 40,
        textCapitalization: TextCapitalization.words, textInputAction: TextInputAction.go,
        decoration: const InputDecoration(labelText: 'Nama pengguna', hintText: 'Contoh: Maruli', prefixIcon: Icon(Icons.person_outline)),
        validator: (value) => value == null || value.trim().isEmpty ? 'Isi namamu terlebih dahulu.' : null,
        onFieldSubmitted: (_) => _start())),
      const SizedBox(height: 16),
      PrimaryButton(label: quiz.started ? 'Mulai sesi baru' : 'Mulai kuis', onPressed: () async {
        if (!_formKey.currentState!.validate()) return;
        if (quiz.started) {
          final confirmed = await showDialog<bool>(context: context, builder: (context) => AlertDialog(
            title: const Text('Mulai sesi baru?'), content: const Text('Jawaban dan hasil sesi sebelumnya akan dihapus.'),
            actions: [TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Batal')),
              FilledButton(onPressed: () => Navigator.pop(context, true), child: const Text('Mulai baru'))]));
          if (!mounted || confirmed != true) return;
        }
        _start();
      }),
      if (quiz.started) ...[
        const SizedBox(height: 16),
        Text('Sesi ${quiz.name} • ${quiz.answeredCount}/${quiz.questions.length} terjawab'),
        const SizedBox(height: 8),
        OutlinedButton.icon(onPressed: () => Navigator.pushNamed(context, quiz.finished ? '/result' : '/quiz'),
          icon: Icon(quiz.finished ? Icons.emoji_events_outlined : Icons.play_arrow_rounded),
          label: Text(quiz.finished ? 'Lihat hasil terakhir' : 'Lanjutkan progres')),
      ],
      const SizedBox(height: 24),
      const Divider(),
      const SizedBox(height: 12),
      const Text('Cara bermain', style: TextStyle(fontWeight: FontWeight.w700)),
      const SizedBox(height: 8),
      const Text('1. Pilih satu jawaban untuk setiap soal.\n2. Kamu dapat kembali dan mengganti jawaban.\n3. Selesaikan semua soal untuk melihat skor.'),
    ]));
    return Scaffold(appBar: AppBar(title: const Text('quizora', style: TextStyle(fontWeight: FontWeight.w700)),
      actions: const [ThemeToggle(), SizedBox(width: 12)]),
      body: SafeArea(child: ResponsivePage(builder: (context, wide) => wide
        ? Row(crossAxisAlignment: CrossAxisAlignment.start, children: [Expanded(child: hero), const SizedBox(width: 40), Expanded(child: form)])
        : Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [hero, const SizedBox(height: 28), form]))));
  }
}
