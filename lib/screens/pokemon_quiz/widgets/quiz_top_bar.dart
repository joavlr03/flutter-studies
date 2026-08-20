import 'package:flutter/material.dart';

class QuizTopBar extends StatelessWidget {
  final VoidCallback? onSkip;

  const QuizTopBar({
    super.key,
    required this.onSkip,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          const EdgeInsets.fromLTRB(
        16,
        12,
        16,
        4,
      ),
      padding:
          const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color:
            Theme.of(context).colorScheme.surface,
        borderRadius:
            BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor:
                Theme.of(context)
                    .colorScheme
                    .primaryContainer,
            child: Icon(
              Icons.catching_pokemon,
              color: Theme.of(context)
                  .colorScheme
                  .primary,
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Text(
              'Quem é esse Pokémon?',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(
                    fontWeight:
                        FontWeight.bold,
                  ),
            ),
          ),

          TextButton(
            onPressed: onSkip,
            child: const Text(
              'Pular',
            ),
          ),
        ],
      ),
    );
  }
}