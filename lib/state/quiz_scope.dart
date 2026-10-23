import 'package:flutter/widgets.dart';
import 'quiz_controller.dart';

/// InheritedNotifier menghubungkan ChangeNotifier ke widget tanpa paket tambahan.
class QuizScope extends InheritedNotifier<QuizController> {
  const QuizScope({super.key, required QuizController controller, required super.child})
      : super(notifier: controller);
  static QuizController of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<QuizScope>();
    assert(scope != null, 'QuizScope harus membungkus aplikasi.');
    return scope!.notifier!;
  }
}
