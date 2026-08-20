import 'package:flutter/material.dart';

class QuizPrimaryButton
    extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onPressed;

  const QuizPrimaryButton({
    super.key,
    required this.icon,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: FilledButton.icon(
        onPressed: onPressed,
        icon: Icon(icon),
        label: Text(
          text,
          style:
              const TextStyle(
            fontSize: 16,
            fontWeight:
                FontWeight.w600,
          ),
        ),
        style: FilledButton.styleFrom(
          shape:
              RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(14),
          ),
        ),
      ),
    );
  }
}