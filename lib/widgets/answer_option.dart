import 'package:flutter/material.dart';

class AnswerOption extends StatelessWidget {
  const AnswerOption(
      {super.key,
      required this.index,
      required this.text,
      required this.selected,
      required this.onTap});
  final int index;
  final String text;
  final bool selected;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Semantics(
        selected: selected,
        button: true,
        child: Material(
          color: selected ? colors.primaryContainer : colors.surface,
          borderRadius: BorderRadius.circular(18),
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(18),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                      color: selected ? colors.primary : colors.outlineVariant,
                      width: selected ? 2 : 1)),
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                CircleAvatar(
                    radius: 16,
                    backgroundColor: selected
                        ? colors.primary
                        : colors.surfaceContainerHighest,
                    foregroundColor:
                        selected ? colors.onPrimary : colors.onSurface,
                    child: Text(String.fromCharCode(65 + index))),
                const SizedBox(width: 14),
                Expanded(
                    child: Text(text,
                        style: Theme.of(context).textTheme.bodyLarge)),
                if (selected) ...[
                  const SizedBox(width: 8),
                  Icon(Icons.check_circle, color: colors.primary)
                ],
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
