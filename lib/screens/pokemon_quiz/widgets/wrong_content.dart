import 'package:flutter/material.dart';

import '../../../models/pokemon.dart';
import '../../../theme/app_colors.dart';
import 'pokemon_image.dart';
import 'pokemon_number.dart';
import 'quiz_primary_button.dart';

class WrongContent extends StatelessWidget {
  final Pokemon pokemon;

  final String userAnswer;

  final VoidCallback onNext;

  const WrongContent({
    super.key,
    required this.pokemon,
    required this.userAnswer,
    required this.onNext,
  });

  String formatName(String name) {
    if (name.isEmpty) {
      return name;
    }

    return '${name[0].toUpperCase()}${name.substring(1)}';
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      key: const ValueKey('wrong'),
      children: [
        PokemonImage(imageUrl: pokemon.imageUrl),

        const SizedBox(height: 14),

        PokemonNumber(id: pokemon.id),

        const SizedBox(height: 16),

        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: isDark ? AppColors.errorDark : AppColors.errorLight,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                backgroundColor: AppColors.error,
                child: Icon(Icons.close, color: Colors.white),
              ),

              const SizedBox(width: 14),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Você errou!',
                      style: TextStyle(
                        color: AppColors.error,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),

                    const SizedBox(height: 4),

                    Text(
                      'Era ${formatName(pokemon.name)}',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Text(
                      'Você digitou: $userAnswer',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 16),

        QuizPrimaryButton(
          icon: Icons.arrow_forward,
          text: 'Próxima rodada',
          onPressed: onNext,
        ),
      ],
    );
  }
}