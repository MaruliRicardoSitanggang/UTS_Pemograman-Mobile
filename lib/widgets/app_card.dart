import 'package:flutter/material.dart';

class AppCard extends StatelessWidget {
  const AppCard({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) => Container(
        padding: EdgeInsets.all(
            (MediaQuery.sizeOf(context).width * .045).clamp(18.0, 32.0)),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(28),
            border: Border.all(
                color: Theme.of(context).colorScheme.outlineVariant)),
        child: child,
      );
}
