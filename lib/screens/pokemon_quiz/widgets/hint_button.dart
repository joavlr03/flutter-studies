import 'package:flutter/material.dart';

class HintButton extends StatelessWidget {
  final VoidCallback onPressed;

  const HintButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: OutlinedButton.icon(
        onPressed: onPressed,

        icon: const Icon(
          Icons.lightbulb_outline,
        ),

        label: const Text(
          'Dar dica',
        ),

        style:
            OutlinedButton.styleFrom(
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