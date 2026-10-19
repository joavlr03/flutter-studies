import 'package:flutter/material.dart';

import '../../../models/pokemon.dart';
import 'hint_button.dart';
import 'hint_card.dart';
import 'pokemon_image.dart';
import 'pokemon_number.dart';
import 'quiz_primary_button.dart';

class PlayingContent extends StatelessWidget {
  final Pokemon pokemon;

  final TextEditingController controller;

  final String? hint;

  final VoidCallback onConfirm;
  final VoidCallback onHint;

  const PlayingContent({
    super.key,
    required this.pokemon,
    required this.controller,
    required this.hint,
    required this.onConfirm,
    required this.onHint,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      key: const ValueKey('playing'),
      children: [
        PokemonImage(imageUrl: pokemon.imageUrl, silhouette: true),

        const SizedBox(height: 20),

        TextField(
          controller: controller,
          autocorrect: false,
          textInputAction: TextInputAction.done,

          onSubmitted: (_) {
            onConfirm();
          },

          decoration: const InputDecoration(
            labelText: 'Digite o nome do Pokémon',
            hintText: 'Ex.: Pikachu',
            prefixIcon: Icon(Icons.catching_pokemon),
          ),
        ),

        if (hint != null) ...[
          const SizedBox(height: 12),

          HintCard(hint: hint!),
        ],

        const SizedBox(height: 16),

        QuizPrimaryButton(
          icon: Icons.check,
          text: 'Confirmar',
          onPressed: onConfirm,
        ),

        const SizedBox(height: 10),

        HintButton(onPressed: onHint),
      ],
    );
  }
}
