import 'package:flutter/material.dart';

class StatChip extends StatelessWidget {
  const StatChip({super.key, required this.icon, required this.text});
  final IconData icon;
  final String text;
  @override
  Widget build(BuildContext context) => Chip(
        avatar: Icon(icon, size: 18),
        label: Text(text),
        side: BorderSide.none,
        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      );
}
