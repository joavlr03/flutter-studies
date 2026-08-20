import 'package:flutter/material.dart';

import '../../../models/pokemon.dart';
import '../../../theme/app_colors.dart';
import 'pokemon_image.dart';
import 'pokemon_number.dart';
import 'quiz_primary_button.dart';

class CorrectContent extends StatelessWidget {
  final Pokemon pokemon;
  final VoidCallback onNext;

  const CorrectContent({
    super.key,
    required this.pokemon,
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
      key: const ValueKey('correct'),
      children: [
        PokemonImage(imageUrl: pokemon.imageUrl),

        const SizedBox(height: 14),

        PokemonNumber(id: pokemon.id),

        const SizedBox(height: 16),

        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: isDark ? AppColors.successDark : AppColors.successLight,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              const CircleAvatar(
                backgroundColor: AppColors.success,
                child: Icon(Icons.check, color: Colors.white),
              ),

              const SizedBox(width: 14),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Você acertou!',
                      style: TextStyle(
                        color: AppColors.success,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),

                    const SizedBox(height: 4),

                    Text(
                      formatName(pokemon.name),
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
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