import 'package:flutter/material.dart';

/// Lebar konten, padding, dan pergantian kolom mengikuti ruang layar.
class ResponsivePage extends StatelessWidget {
  const ResponsivePage({super.key, required this.builder});
  final Widget Function(BuildContext context, bool wide) builder;
  @override
  Widget build(BuildContext context) => LayoutBuilder(builder: (context, bounds) {
    final padding = (bounds.maxWidth * .05).clamp(16.0, 40.0);
    return SingleChildScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      padding: EdgeInsets.all(padding),
      child: Center(child: ConstrainedBox(constraints: const BoxConstraints(maxWidth: 1040),
        child: builder(context, bounds.maxWidth >= 760))),
    );
  });
}
