import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({super.key, required this.label, required this.onPressed,
    this.icon = Icons.arrow_forward_rounded});
  final String label;
  final VoidCallback? onPressed;
  final IconData icon;
  @override
  Widget build(BuildContext context) => SizedBox(width: double.infinity,
    child: FilledButton.icon(onPressed: onPressed, icon: Icon(icon),
      label: Text(label, textAlign: TextAlign.center)));
}
