import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quizora/app.dart';
import 'package:quizora/screens/home_screen.dart';
import 'package:quizora/state/quiz_scope.dart';

void main() {
  testWidgets('nama wajib, jawaban tetap setelah rotasi dan navigasi',
      (tester) async {
    tester.view.devicePixelRatio = 1;
    tester.view.physicalSize = const Size(390, 844);
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(const QuizoraApp());
    final start = find.text('Mulai kuis');
    await tester.ensureVisible(start);
    await tester.tap(start);
    await tester.pumpAndSettle();
    expect(find.text('Isi namamu terlebih dahulu.'), findsOneWidget);
    await tester.enterText(find.byKey(const Key('name_field')), 'Maruli');
    await tester.ensureVisible(start);
    await tester.tap(start);
    await tester.pumpAndSettle();
    await tester.ensureVisible(find.text('Dart'));
    await tester.tap(find.text('Dart'));
    await tester.pumpAndSettle();
    tester.view.physicalSize = const Size(844, 390);
    await tester.pumpAndSettle();
    expect(find.text('1 dari 10 soal terjawab'), findsOneWidget);
    expect(tester.takeException(), isNull);
    await tester.pageBack();
    await tester.pumpAndSettle();
    final resume = find.text('Lanjutkan progres');
    await tester.ensureVisible(resume);
    await tester.tap(resume);
    await tester.pumpAndSettle();
    expect(find.text('1 dari 10 soal terjawab'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
  testWidgets('hasil, pembahasan, tema dan berbagai ukuran layar',
      (tester) async {
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(const QuizoraApp());
    final context = tester.element(find.byType(HomeScreen));
    final quiz = QuizScope.of(context);
    quiz.start('Maruli');
    for (var i = 0; i < quiz.questions.length; i++) {
      quiz.goTo(i);
      quiz.selectAnswer(quiz.current.correctIndex);
    }
    quiz.finish();
    Navigator.of(context).pushNamed('/result');
    await tester.pumpAndSettle();
    expect(find.text('100'), findsOneWidget);
    for (final size in [
      const Size(320, 568),
      const Size(844, 390),
      const Size(1024, 768)
    ]) {
      tester.view.physicalSize = size;
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);
    }
    await tester.ensureVisible(find.text('Lihat pembahasan'));
    await tester.tap(find.text('Lihat pembahasan'));
    await tester.pumpAndSettle();
    expect(find.text('Belajar dari setiap jawaban'), findsOneWidget);
    quiz.toggleTheme();
    await tester.pumpAndSettle();
    expect(Theme.of(tester.element(find.text('Pembahasan'))).brightness,
        Brightness.dark);
    expect(tester.takeException(), isNull);
  });
}
